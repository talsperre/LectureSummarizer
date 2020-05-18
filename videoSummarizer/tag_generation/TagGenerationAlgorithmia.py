'''
API License: https://algorithmia.com/api_dev_terms
Modified by: Gulshan Kumar
'''


import Algorithmia
from config import *
from TagGenerationInterface import TagGenerationInterface


class TagGenrationAlgorithmia(TagGenerationInterface):
    def __init__(self, timeout = 300):
        self.timeout = timeout
    
    def generate_tags(self, data, top_n):
        client = Algorithmia.client(KEY)
        algo = client.algo('nlp/AutoTag/1.0.1')
        algo.set_options(timeout=self.timeout)
        return algo.pipe(data).result
    
    def __str__(self):
        pass
