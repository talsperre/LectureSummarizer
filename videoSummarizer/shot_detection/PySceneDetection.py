import pandas as pd
import os
import subprocess
import math
from datetime import datetime, timedelta

from ShotDetectionInterface import ShotDetectionInterface
import secrets


class PySceneDetection(ShotDetectionInterface):
    def __init__(self, no_of_bytes = 32, threshold = 20, output_path = './shot_detection/video_scenes/', video_format = '.mp4'):
        self.no_of_bytes = no_of_bytes
        self.modified_split = pd.DataFrame()
        self.to_add = 0
        self.threshold = threshold
        self.output_path = output_path
        self.video_name = str()
        self.video_format = video_format

    def generate_scenes(self, local_video_path):
        """Generates csv for detecting important scenes"""
        command_list = ['scenedetect']
        inputs = ['-i', os.path.abspath(local_video_path)]
        framerate = ['-f', '29.97']
        output = ['-o', self.output_path]
        stats = ['-s', self.video_name + '.stats.csv']
        detect_content = ['detect-content', '-t', str(self.threshold)]
        list_scenes = ['list-scenes']
        execute_command = (command_list + inputs + framerate + output + stats + detect_content + list_scenes)
        subprocess.call(execute_command)

    def get_random_video_name(self):
        return secrets.token_urlsafe(self.no_of_bytes)

    def get_total_minutes(self, row):
        """Returns total minutes for a video"""
        length_timecode = row['Length (timecode)'].split(':')
        hours,minutes = int(length_timecode[0]) ,int(length_timecode[1])
        minutes += hours*60
        no_of_splits = math.ceil(minutes/5.0)
        return (minutes, no_of_splits)

    def append_dataframe(self, values, filename):
        dict_to_append = {}
        dict_to_append['Start Timecode'] = [values[0]]
        dict_to_append['End Timecode'] = [values[1]]
        dict_to_append['Length (timecode)'] = [values[2]]
        dict_to_append['filename'] = [filename]
        self.modified_split = self.modified_split.append(pd.DataFrame(dict_to_append),ignore_index=True)

    def add_last_frame(self, row):
        start_time = self.convert_str_to_datetime(list(self.modified_split['Start Timecode'])[-1])
        duration = self.convert_str_to_datetime(list(self.modified_split['Length (timecode)'])[-1])
        duration += self.convert_str_to_datetime(row['Length (timecode)'])
        end_time = start_time + duration
        start_time = list(self.modified_split['Start Timecode'])[-1]
        return [start_time, str(end_time), str(duration)]

    def small_frames(self, row):
        filename = self.get_random_video_name()
        if len(self.modified_split) != 0:
            values = self.add_last_frame(row)
            self.modified_split.drop(self.modified_split.tail(1).index,inplace=True)
            self.to_add = 0
        else:
            self.to_add = 1
            values = [str(row['Start Timecode']), str(row['End Timecode']), str(row['Length (timecode)'])]
        self.append_dataframe(values, filename)

    def next_frames(self, no_of_splits, duration, row):
        for i in range(1,no_of_splits - 1):
            start_time = self.convert_str_to_datetime(list(self.modified_split['End Timecode'])[-1])
            start_time_act = list(self.modified_split['End Timecode'])[-1]
            values = [start_time_act, str(start_time + duration), str(duration)]
            filename = self.get_random_video_name()
            self.append_dataframe(values, filename)
        start_time = self.convert_str_to_datetime(list(self.modified_split['End Timecode'])[-1])
        rem_length = self.convert_str_to_datetime(row['Length (timecode)']) 
        rem_length -= (duration*(no_of_splits-1))
        filename = self.get_random_video_name()
        start_time_act = list(self.modified_split['End Timecode'])[-1]
        values = [start_time_act, str(start_time + rem_length), str(rem_length)]
        self.append_dataframe(values, filename)

    def large_frames(self, row, no_of_splits):
        filename = self.get_random_video_name()
        duration = self.convert_str_to_datetime(row['Length (timecode)']) / no_of_splits
        if self.to_add == 1:
            start_time = self.convert_str_to_datetime(list(self.modified_split['Start Timecode'])[-1])
            new_duration = duration + self.convert_str_to_datetime(list(self.modified_split['Length (timecode)'])[-1])
            start_time_act = list(self.modified_split['Start Timecode'])[-1]
            self.modified_split.drop(self.modified_split.tail(1).index,inplace=True)
            self.to_add = 0
        else:
            start_time = self.convert_str_to_datetime(row['Start Timecode'])
            start_time_act = str(start_time)
            new_duration = duration
        values = [start_time_act, str(start_time + new_duration), str(new_duration)]
        self.append_dataframe(values, filename)
        self.next_frames(no_of_splits, duration, row)

    def intermediate_frames(self, row):
        values = []
        filename = self.get_random_video_name()
        if self.to_add == 1:
            values = self.add_last_frame(row)
            self.modified_split.drop(self.modified_split.tail(1).index,inplace=True)
            self.to_add = 0
        else:
            values = [str(row['Start Timecode']), str(row['End Timecode']), str(row['Length (timecode)'])]
        self.append_dataframe(values, filename)

    def get_optimal_splits(self, local_file_path):
        """Combines small splits or breaks large splits of the video"""
        splits = pd.read_csv(local_file_path,skiprows=1)
        self.modified_split = pd.DataFrame({'Start Timecode':[],'End Timecode':[],'Length (timecode)':[],'filename':[]})
        self.to_add = 0
        for index, row in splits.iterrows():
            (minutes, no_of_splits) = self.get_total_minutes(row)
            if minutes > 5:
                self.large_frames(row,no_of_splits)
            elif minutes < 1:
                self.small_frames(row)
            else:
                self.intermediate_frames(row)
        self.modified_split.to_csv(os.path.join(self.output_path, self.video_name + '_split_times.csv'), index=False)

    def get_video_name_from_filepath(self, local_video_path):
        return local_video_path.split('/')[-1].split('.')[0]

    def detect_scenes(self, local_video_path):
        self.video_name = self.get_video_name_from_filepath(local_video_path)
        print("Video_name : ", self.video_name)
        self.generate_scenes(local_video_path)
        generated_csv = os.path.join(self.output_path, self.video_name + '.stats.csv')
        df = pd.read_csv(generated_csv,skiprows=1)
        video_len = df['Timecode'].max().split(':')
        video_len = int(video_len[0]*60) + int(video_len[1])
        self.threshold = self.search_threshold(video_len, generated_csv)
        self.generate_scenes(local_video_path)
        self.get_optimal_splits(os.path.join(self.output_path, self.video_name + '-Scenes.csv'))

    def convert_str_to_datetime(self, str_time):
        """Converts string to datetime object"""
        obj = datetime.strptime(str_time, '%H:%M:%S.%f')
        time_object = timedelta(hours=obj.hour,minutes=obj.minute,seconds=obj.second,milliseconds=obj.microsecond/1e3)
        return time_object

    def search_threshold(self, length_of_video, local_file_path):
        """Returns threshold for generating better splits"""
        dataframe = pd.read_csv(local_file_path, skiprows=1)
        lower_limit = length_of_video/5
        mi, ans = 1e18, 0
        f = 0
        for i in range(1, int(dataframe['content_val'].max())+1):
            num = len(dataframe[dataframe['content_val']>i])
            if(num >= lower_limit and (num-lower_limit)<=mi):
                f = 1
                mi = num-lower_limit
                ans = i
        if f != 0:
            return ans
        else:
            return -1



