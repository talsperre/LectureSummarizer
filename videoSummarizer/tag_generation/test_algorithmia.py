from TagGenerationAlgorithmia import TagGenrationAlgorithmia
import sys

with open(sys.argv[1], 'r') as file:
    data = file.read().replace('\n', '')

obj = TagGenrationAlgorithmia()
keywords = obj.generate_tags(data)

print("The Keywords are : {}".format(keywords))
