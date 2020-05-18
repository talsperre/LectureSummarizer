from TagGenerationPMI import TagGenrationPMI
import sys

with open(sys.argv[1], 'r') as file:
    data = file.read().replace('\n', '')

data = data.split(' ')

obj = TagGenrationPMI()
bigrams, trigrams = obj.generate_tags(data)

print("Bigrams are : {}".format(bigrams))
print("Trigrams are : {}".format(trigrams))
