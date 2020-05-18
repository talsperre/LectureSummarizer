import abc

class TagGenerationInterface(abc.ABC):
    @abc.abstractmethod
    def generate_tags(text, top_n):
        pass
