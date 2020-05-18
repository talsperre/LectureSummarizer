import secrets
import os
import io
import wave

from google.cloud import speech, storage
from google.cloud.speech import enums, types
from pydub import AudioSegment
from SpeechRecognitionInterface import SpeechRecognitionInterface
from SpeechRecognitionConfig import GOOGLE_CLOUD_BUCKET_NAME

storage.blob._DEFAULT_CHUNKSIZE = 10 * 1024* 1024  #10 MB

class GoogleSpeechRecognition(SpeechRecognitionInterface):
    def __init__(self, language, blob_length=32, enable_separate_recognition_per_channel=True):
        self.language = language
        self.blob_length = blob_length
        self.enable_separate_recognition_per_channel = True
        self.bucket_name = GOOGLE_CLOUD_BUCKET_NAME
        self.encoding = enums.RecognitionConfig.AudioEncoding.LINEAR16
    
    def upload_audio(self, source_file_name, destination_blob_name):
        """Uploads a file to the bucket."""
        storage_client = storage.Client()
        bucket = storage_client.bucket(self.bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.upload_from_filename(source_file_name)
    
    def delete_audio(self, destination_blob_name):
        """Deletes a file from the bucket."""
        storage_client = storage.Client()
        bucket = storage_client.get_bucket(self.bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.delete()    

    def get_audio_url(self, destination_blob_name):
        return "gs://{}/{}".format(self.bucket_name, destination_blob_name)
    
    def get_random_blob_name(self):
        return secrets.token_urlsafe(self.blob_length)

    def transcribe(self, local_file_path):
        destination_blob_name = self.get_random_blob_name()
        print(destination_blob_name)
        self.upload_audio(local_file_path, destination_blob_name)
        audio_url =  self.get_audio_url(destination_blob_name)
        audio_config = self.get_audio_config(local_file_path)
        transcript = self.get_best_transcript(audio_url, audio_config)
        self.delete_audio(destination_blob_name)
        return transcript
    
    def get_best_transcript(self, audio_url, audio_config):
        client = speech.SpeechClient()
        audio = types.RecognitionAudio(uri=audio_url)
        # Detects speech in the audio file
        operation = client.long_running_recognize(audio_config, audio)
        response = operation.result(timeout=10000)
        transcript = ""
        for result in response.results:
            # First alternative is the most probable result
            transcript += result.alternatives[0].transcript
        return transcript
    
    def get_audio_config(self, local_file_path):
        frame_rate, num_channels = self.get_frame_rate_channel(local_file_path)
        config = types.RecognitionConfig(
            encoding=self.encoding,
            sample_rate_hertz=frame_rate,
            language_code=self.language,
            audio_channel_count=num_channels,
            enable_separate_recognition_per_channel=self.enable_separate_recognition_per_channel,
            enable_automatic_punctuation=True
        )
        return config
    
    def get_frame_rate_channel(self, local_file_path):
        with wave.open(local_file_path, "rb") as wave_file:
            frame_rate = wave_file.getframerate()
            num_channels = wave_file.getnchannels()
        return frame_rate, num_channels