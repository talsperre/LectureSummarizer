from YakeSummarization import YakeSummarization

ob = YakeSummarization()

with open('sample.txt', 'r') as f:
    text = f.read()

keywords = ob.summarize(text)
print(keywords)
