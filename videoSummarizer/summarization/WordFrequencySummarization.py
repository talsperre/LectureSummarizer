"""
NLTK Word Frequency Summarization
Modified : Shashank
Original author: Akash P 
"""

import nltk
import hashlib
import numpy as np

from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize, sent_tokenize
from hashlib import sha224
from SummarizationInterface import SummarizationInterface
from pprint import pprint

class WordFrequencySummarization(SummarizationInterface):
    def __init__(self, language="english", high_threshold_constant=1.35, low_threshold_constant=1.0, min_sentence_length=6):
        self.language = language
        self.high_threshold_constant = high_threshold_constant
        self.low_threshold_constant = low_threshold_constant
        self.stop_words = set(stopwords.words(self.language))
        self.porter_stemmer = PorterStemmer()
        self.min_sentence_length = min_sentence_length

    def summarize(self, text, top_n=10):
        word_freq_dict = self.get_frequency_table(text)
        sentences = sent_tokenize(text)
        sentence_scores = self.score_sentences(sentences, word_freq_dict)
        threshold = self.get_average_sentence_score(sentence_scores)
        summary = self.generate_summary(sentences, sentence_scores, 		self.high_threshold_constant * threshold)
        if not self.is_summary_long(summary):
            summary = self.generate_summary(sentences, sentence_scores, self.low_threshold_constant * threshold)
        summary_sentences, _ = list(zip(*summary))
        filtered_summary_sentences = self.filter_sentences(summary_sentences)
        return filtered_summary_sentences

    def is_summary_long(self, summary):
        return len(summary) >= 3

    def get_frequency_table(self, text):
        words = word_tokenize(text)
        words = self.filter_words(words)
        word_freq_dict = dict(nltk.FreqDist(words))
        return word_freq_dict

    def filter_words(self, words_list):
        words = [self.porter_stemmer.stem(word) for word in words_list]
        words = [word for word in words if word not in self.stop_words]
        return words

    def filter_sentences(self, sentences_list):
        return [sentence for sentence in sentences_list if self.get_sentence_length(sentence) >= self.min_sentence_length]

    def get_sentence_hash(self, sentence):
        return hashlib.sha224(sentence.encode('utf-8')).hexdigest()

    def get_sentence_length(self, sentence):
        return len(sentence.split(" "))

    def score_sentences(self, sentences, word_freq_dict):
        sentence_scores = dict()
        for sentence in sentences:
            sentence_hash = self.get_sentence_hash(sentence)
            num_words_excluding_stopwords, sum_score = 0, 0
            word_list = []
            for word in word_freq_dict:
                if word in sentence.lower():
                    num_words_excluding_stopwords += 1
                    sum_score += word_freq_dict[word]
                    word_list.append(word)
            sentence_scores[sentence_hash] = sum_score / num_words_excluding_stopwords
        return sentence_scores

    def get_average_sentence_score(self, sentence_scores):
        return np.mean(list(sentence_scores.values()))

    def generate_summary(self, sentences, sentence_scores, threshold):
        summary = []
        for sentence in sentences:
            sentence_hash = self.get_sentence_hash(sentence)
            if sentence_scores[sentence_hash] >= threshold:
                summary.append((sentence, sentence_scores[sentence_hash]))
        return summary
