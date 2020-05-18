import os
import ffmpeg

class AudioGeneration():
    def __init__(self, output_format='wav', num_out_channels=1):
        self.output_format = output_format
        self.num_out_channels = num_out_channels

    def convert_audio(self, input_path, output_path):
        try:
            stream = ffmpeg.input(input_path)
            stream = ffmpeg.output(
                stream,
                output_path,
                f=self.output_format, # Output file format
                ac=self.num_out_channels, # Num of output channels (mono or stereo audio)
                vn=None, # No video
            )
            stream.run()
        except ffmpeg.Error as e:
            print('stdout:', e.stdout.decode('utf8'))
            print('stderr:', e.stderr.decode('utf8'))
