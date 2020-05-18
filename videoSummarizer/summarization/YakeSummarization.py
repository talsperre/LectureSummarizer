import yake

from SummarizationInterface import SummarizationInterface

class YakeSummarization(SummarizationInterface):
    def __init__(self, language="en", max_ngram_size=3):
        self.keyword_extractor = yake.KeywordExtractor(lan=language, n=max_ngram_size)
    
    def summarize(self, text, top_n=10):
        keywords_score = self.keyword_extractor.extract_keywords(text)
        keywords, scores = list(zip(*keywords_score))
        best_keywords = self.get_best_keywords(keywords, top_n)
        return best_keywords
    
    def get_best_keywords(self, keywords, top_n):
        # Remove unigrams that are already part of bigrams or trigrams
        assert top_n <= 20, "Number of keywords is greater than 20"
        best_keywords, num_keywords = [], 0
        for keyword in keywords:
            is_unigram = self.is_unigram(keyword)
            if is_unigram and self.is_present_in_bigrams_trigrams(keyword, keywords):
                continue
            best_keywords.append(keyword)
            num_keywords += 1
        best_keywords_sorted = sorted(best_keywords, key=self.score, reverse=True)
        return best_keywords_sorted[:top_n]
    
    def score(self, keyword):
        return (len(keyword.split(" ")), len(keyword))
    
    def is_unigram(self, keyword):
        num_words = len(keyword.split(" "))
        return num_words == 1
    
    def is_present_in_bigrams_trigrams(self, unigram, best_keywords):
        for keyword in best_keywords:
            if not self.is_unigram(keyword):
                if unigram in keyword:
                    return True
        return False
