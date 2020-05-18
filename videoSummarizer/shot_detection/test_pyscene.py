from SplitVideo import SplitVideo

def start_video_splits(video_path, output_folder):
    ob = SplitVideo(no_of_bytes = 32, threshold = 20, output_path=output_folder, metadata_path="./metadata", video_format = '.mp4')
    ob.video_splits(video_path)

start_video_splits("/Users/shashanks./college/semester-8/Software-Engineering/project/test/isb_2.mp4", "./video_scenes/")