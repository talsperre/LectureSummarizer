import pandas as pd
import os
import math
import datetime
import secrets
import ffmpeg

from SplitVideoInterface import SplitVideoInterface
from PySceneDetection import PySceneDetection

class SplitVideo(SplitVideoInterface):
    def __init__(self, no_of_bytes = 32, threshold = 20, metadata_path="./metadata/", output_path='./shot_detection/video_scenes/', video_format = '.mp4'):
        self.video_name = str()
        self.no_of_bytes = no_of_bytes
        self.threshold = threshold
        self.metadata_path = metadata_path
        self.output_path = output_path
        self.video_format = video_format
        os.makedirs(self.output_path, exist_ok=True)
        os.makedirs(self.metadata_path, exist_ok=True)

    def video_splits(self, local_video_path):
        ob = PySceneDetection(self.no_of_bytes, self.threshold, self.metadata_path, self.video_format)
        ob.detect_scenes(local_video_path)
        self.video_name = ob.get_video_name_from_filepath(local_video_path)
        local_file_path = os.path.join(self.metadata_path, self.video_name + '_split_times.csv')
        dataframe = pd.read_csv(local_file_path)
        for index, rows in dataframe.iterrows():
            output_file_path = os.path.join(self.output_path, rows['filename'] + self.video_format)
            self.best_splits(local_video_path, output_file_path, rows['Start Timecode'], rows['End Timecode'])

    def best_splits(self, input_path, output_path, start_time, end_time):
        """Splits the given video as detected by Class PySceneDetection"""
        try:
            stream = ffmpeg.input(input_path)
            stream = ffmpeg.output(
                stream,
                output_path,          # Output file path
                vcodec="copy",        # The video codec
                acodec="copy",        # The audio codec
                ss=start_time,        # Start time of split
                to=end_time           # End time of split
            )
            stream.run()
        except ffmpeg.Error as e:
            print('stdout:', e.stdout.decode('utf8'))
            print('stderr:', e.stderr.decode('utf8'))