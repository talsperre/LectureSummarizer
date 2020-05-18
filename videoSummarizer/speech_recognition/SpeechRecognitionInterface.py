import abc

class SpeechRecognitionInterface(abc.ABC):
    @abc.abstractmethod
    def transcribe(local_file_path):
        pass

    @abc.abstractclassmethod
    def get_audio_config(local_file_path):
        pass
