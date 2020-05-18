import abc

class SplitVideoInterface(abc.ABC):

    @abc.abstractmethod
    def video_splits(local_file_path):
        pass
