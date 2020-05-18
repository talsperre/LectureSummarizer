from GoogleSpeechRecognition import GoogleSpeechRecognition

ob = GoogleSpeechRecognition(language="en-US", blob_length=32)
# transcript = ob.transcribe("/Users/shashanks./college/semester-8/Software-Engineering/project/speech_recognition/audio_wav/philosophy.wav")
transcript = ob.transcribe("/home/shreya/Desktop/audio.wav")
print(transcript)

