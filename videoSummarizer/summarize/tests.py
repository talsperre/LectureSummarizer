from django.test import TestCase
from django.test import Client
from .forms import *
from .models import *


class User_Form_Test(TestCase):

    # Invalid Form Data
    def test_SignUpForm_invalid(self):
        form = SignUpForm(data={'email': "", 'password': "mp", 'ame': "mp"})
        self.assertFalse(form.is_valid())


class VideoTest(TestCase):
    def create_video(self, UserID, VideoPath, Name):
        return Video.objects.create(UserID = UserID, VideoPath = VideoPath, Name = Name)

    def test_video(self):
        user = User.objects.create(first_name="user", username="user3", email="user@google.com", password="user2")
        video = self.create_video(user, "/videos/video.mp4", "video.mp4")
        self.assertTrue(isinstance(video, Video))


class SplitTest(TestCase):
    def create_split(self, SplitPath):
        return Split.objects.create(SplitPath = SplitPath)

    def test_video(self):
        split = self.create_split("/videos/split1.mp4")
        self.assertTrue(isinstance(split, Split))


class SplitTranscriptTest(TestCase):
    def create_split_transcript(self, SplitID, Transcript):
        return SplitTranscript.objects.create(SplitID = SplitID, Transcript = Transcript)

    def test_split_transcript(self):
        split = Split.objects.create(SplitPath = "/videos/split1.mp4")
        splittranscript = self.create_split_transcript(split, "transcript")
        self.assertTrue(isinstance(splittranscript, SplitTranscript))


class SplitSpeechTest(TestCase):
    def create_split_speech(self, SplitID, SpeechPath):
        return SplitSpeech.objects.create(SplitID = SplitID, SpeechPath = SpeechPath)

    def test_split_transcript(self):
        split = Split.objects.create(SplitPath = "/videos/split1.mp4")
        splitspeech = self.create_split_speech(split, "/audio/1.wav")
        self.assertTrue(isinstance(splitspeech, SplitSpeech))


class SplitSummaryTest(TestCase):
    def create_split_summary(self, SplitID, Summary):
        return SplitSummary.objects.create(SplitID = SplitID, Summary = Summary)

    def test_split_transcript(self):
        split = Split.objects.create(SplitPath = "/videos/split1.mp4")
        splitsummary = self.create_split_summary(split, "summary")
        self.assertTrue(isinstance(splitsummary, SplitSummary))


class SplitTagTest(TestCase):
    def create_split_tag(self, SplitID, Tag):
        return SplitTag.objects.create(SplitID = SplitID, Tag = Tag)

    def test_split_transcript(self):
        split = Split.objects.create(SplitPath = "/videos/split1.mp4")
        splittag = self.create_split_tag(split, "tags")
        self.assertTrue(isinstance(splittag, SplitTag))
