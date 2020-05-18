from YakeSummarization import YakeSummarization

ob = YakeSummarization()

with open('transcript.txt', 'r') as f:
    text = f.read()

keywords = ob.generate_tags(text)
print(keywords)
