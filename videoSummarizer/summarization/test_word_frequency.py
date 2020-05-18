from WordFrequencySummarization import WordFrequencySummarization

ob = WordFrequencySummarization()

with open('sample.txt', 'r') as f:
    text = f.read()

summary = ob.summarize(text)
print(summary)
