from TagGenerationInterface import TagGenerationInterface
import nltk
from nltk.collocations import *


class TagGenrationPMI(TagGenerationInterface):
    def __init__(self, freq_filter = 3, num_keywords = 10):
        self.freq_filter = freq_filter
        self.num_keywords = num_keywords
    
    def generate_tags(self, data, top_n):
        
        self.num_keywords = top_n
        bigram_measures = nltk.collocations.BigramAssocMeasures()
        trigram_measures = nltk.collocations.TrigramAssocMeasures()
        
        finder1 = BigramCollocationFinder.from_words(data)
        finder1.apply_freq_filter(self.freq_filter)
        bigrams = finder1.nbest(bigram_measures.pmi, self.num_keywords)

        finder2 = TrigramCollocationFinder.from_words(data)
        finder2.apply_freq_filter(self.freq_filter)
        trigrams = finder2.nbest(trigram_measures.pmi, self.num_keywords)

        return bigrams, trigrams
    
    def __str__(self):
        pass