import abc

class ShotDetectionInterface(abc.ABC):
    @abc.abstractmethod
    def detect_scenes(local_video_path):
        pass