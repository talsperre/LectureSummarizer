import abc

class SummarizationInterface(abc.ABC):
    @abc.abstractmethod
    def summarize(text, top_n):
        pass
