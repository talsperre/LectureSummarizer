import os
import importlib
import shutil
import pandas as pd

#import modules here
from media_config import VIDEO_PATH, AUDIO_PATH, METADATA_PATH, MEDIA_PATH, DJANGO_BASE_DIR
from shot_detection.SplitVideo import SplitVideo
from audio_generation.AudioGeneration import AudioGeneration
from speech_recognition.GoogleSpeechRecognition import GoogleSpeechRecognition
from tag_generation.YakeSummarization import YakeSummarization
from summarization.WordFrequencySummarization import WordFrequencySummarization
from summarize.models import *

class SummarizePipeline():
    def __init__(self, video_path, video_id):
        self.video_path = str(video_path)
        self.video_id = video_id
        self.video_name = self.get_video_name_from_path()

        print("-"*100)
        print(self.video_path)
        print(self.video_name)
        print("-"*100)

    def get_video_splits(self):
        shot_detection = SplitVideo(no_of_bytes=32, threshold=20, output_path=VIDEO_PATH, \
            metadata_path=METADATA_PATH, video_format='.mp4')
        shot_detection.video_splits(os.path.join(MEDIA_PATH, self.video_path))
        split_csv_file = os.path.abspath(os.path.join(METADATA_PATH, self.video_name + "_split_times.csv"))
        csv_reader = pd.read_csv(split_csv_file)
        video_split_file_paths = []
        for i, row in csv_reader.iterrows():
            file_name = row['filename']
            video_split_file_paths.append(os.path.join("videos", file_name + ".mp4"))
        return video_split_file_paths

    def insert_into_split_table(self, video_split_paths):
        split_ids = []
        for split_path in video_split_paths:
            split_obj = Split(SplitPath=split_path)
            split_obj.save()
            split_video_obj = VideoSplit(VideoID=Video(self.video_id), SplitID=Split(split_obj.id))
            split_video_obj.save()
            split_ids.append(split_obj.id)
        return split_ids

    def get_audio_splits(self, video_split_file_paths):
        audio_split_paths = []
        for split_video_path in video_split_file_paths:
            split_name = self.get_split_name_from_path(split_video_path)
            audio_file_name = os.path.join("audio", split_name + ".wav")
            audio_file_path = os.path.join(DJANGO_BASE_DIR, AUDIO_PATH, split_name + ".wav")
            split_video_path = os.path.join(DJANGO_BASE_DIR, MEDIA_PATH, split_video_path)
            audio_gen = AudioGeneration()
            audio_gen.convert_audio(split_video_path, audio_file_path)
            audio_split_paths.append(audio_file_path)
        return audio_split_paths

    def insert_into_speech_table(self, audio_split_paths, split_ids):
        for split_id, audio_path in zip(split_ids, audio_split_paths):
            speech_obj = SplitSpeech(SplitID=Split(split_id), SpeechPath=audio_path)
            speech_obj.save()

    def get_split_transcript(self, audio_file_path):
        speech_obj = GoogleSpeechRecognition(language="en-US", blob_length=32)
        transcript = speech_obj.transcribe(audio_file_path)
        return transcript

    def generate_transcripts(self, audio_split_paths):
        transcripts_list = []
        for audio_file in audio_split_paths:
            audio_path = os.path.join(DJANGO_BASE_DIR, MEDIA_PATH, audio_file)
            transcript = self.get_split_transcript(audio_path)
            transcripts_list.append(transcript)
        return transcripts_list

    def insert_into_transcript_table(self, split_ids, transcript_list):
        for split_id, transcript in zip(split_ids, transcript_list):
            st_obj = SplitTranscript(SplitID=Split(split_id), Transcript=transcript)
            st_obj.save()

    def get_tags(self, split_id):
        split_obj = SplitTranscript.objects.get(SplitID=split_id)
        transcript = split_obj.Transcript
        tags_obj = YakeSummarization()
        tags = tags_obj.generate_tags(transcript)
        return tags

    def insert_into_tags_table(self, split_ids):
        for split_id in split_ids:
            tags = self.get_tags(split_id)
            for tag in tags:
                tag_obj = SplitTag(SplitID=Split(split_id), Tag=tag)
                tag_obj.save()

    def get_summaries(self, split_id):
        split_obj = SplitTranscript.objects.get(SplitID=split_id)
        transcript = split_obj.Transcript
        wfsummarization_obj = WordFrequencySummarization()
        summaries = wfsummarization_obj.summarize(transcript)
        return summaries

    def insert_into_summary_table(self, split_ids):
        for split_id in split_ids:
            summaries = self.get_summaries(split_id)
            for summary in summaries:
                summary_obj = SplitSummary(SplitID=Split(split_id), Summary=summary)
                summary_obj.save()

    def run_pipeline(self):
        video_split_file_paths = self.get_video_splits()
        split_ids = self.insert_into_split_table(video_split_file_paths)
        audio_split_paths = self.get_audio_splits(video_split_file_paths)
        self.insert_into_speech_table(audio_split_paths, split_ids)
        transcripts_list = self.generate_transcripts(audio_split_paths)
        self.insert_into_transcript_table(split_ids, transcripts_list)
        self.insert_into_tags_table(split_ids)
        self.insert_into_summary_table(split_ids)

    def get_split_name_from_path(self, split_path):
        split_name = split_path.split("/")[-1]
        split_name, ext = os.path.splitext(split_name)
        return split_name

    def get_video_name_from_path(self):
        video_name = self.video_path.split("/")[-1]
        video_name, ext = os.path.splitext(video_name)
        return video_name