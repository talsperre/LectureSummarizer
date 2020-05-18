from django.shortcuts import render, get_object_or_404
from django.shortcuts import redirect
from django.utils import timezone
from summarize.models import *
from summarize.forms import SignUpForm
from summarize.forms import VideoForm
from summarize.modules import SummarizePipeline

from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from summarize.tokens import account_activation_token
from django.contrib.auth.models import User
from django.utils.encoding import force_text
from django.utils.http import urlsafe_base64_decode
from django.core.mail import send_mail
from django.conf import settings
from django.contrib import messages
import json
import urllib
from django.http import HttpResponseBadRequest, HttpResponse
from django import forms
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def homepage(request):
    return render(request, 'summarize/home.html')


def valitate_recaptcha(recaptcha_response):
    url = 'https://www.google.com/recaptcha/api/siteverify'
    values = {
        'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
        'response': recaptcha_response
    }
    data = urllib.parse.urlencode(values).encode()
    req =  urllib.request.Request(url, data=data)
    response = urllib.request.urlopen(req)
    result = json.loads(response.read().decode())
    return result


def mail_user(user, current_site):
    subject = 'Activate Your Account'
    message = render_to_string('summarize/account_activation_email.html', {
        'user': user,
        'domain': current_site.domain,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_activation_token.make_token(user),
    })
    sender_email = settings.EMAIL_HOST_USER
    recipient_list = [user.email]
    send_mail(subject, message, sender_email, recipient_list)
    # user.email_user(subject, message)


def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            result = valitate_recaptcha(request.POST.get('g-recaptcha-response'))
            if result['success']:
                user = form.save()
                user.refresh_from_db()  # load the profile instance created by the signal
                user.profile.email = form.cleaned_data.get('email')
                user.is_active = False
                user.save()
                current_site = get_current_site(request)
                mail_user(user, current_site)
                return render(request, 'summarize/account_activation_sent.html')
            else:
                messages.error(request, 'Invalid reCAPTCHA. Please try again.')
    else:
        form = SignUpForm()
    return render(request, 'summarize/signup.html', {'form': form})


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.profile.email_confirmed = True
        user.save()
        login(request, user)
        return render(request, 'summarize/home.html')
    else:
        return render(request, 'summarize/account_activation_invalid.html')


def account_activation_sent(request):
    return render(request, 'summarize/account_activation_sent.html')


@login_required
def video_new(request):
    if request.method == 'POST':
        form = VideoForm(request.POST, request.FILES)
        file = request.FILES['VideoPath']
        if form.is_valid():
            video = form.save(commit=False)
            video.UserID = request.user
            video.Name = file.name
            video.save()
            SummarizeObject = SummarizePipeline(video.VideoPath, video.id)
            SummarizeObject.run_pipeline()
            return redirect('video_detail', pk=video.pk)
    else:
        form = VideoForm()
    return render(request, 'summarize/video_new.html', {'form':form} )


def video_detail(request, pk):
    video = get_object_or_404(Video, pk=pk)
    print(video)
    return render(request, 'summarize/video_detail.html', {'video' : video})


@login_required
def video_list(request):
    videos = Video.objects.filter(UserID = request.user)
    paginator = Paginator(videos, 1)
    page = request.GET.get('page')
    try:
        videos = paginator.page(page)
    except PageNotAnInteger:
        videos = paginator.page(1)
    except EmptyPage:
        videos = paginator.page(paginator.num_pages)
    return render(request, 'summarize/video_list.html', {'videos': videos})

def get_relevant_split_data(pk):
    split_ids = sorted(list(VideoSplit.objects.filter(VideoID = pk).values_list('SplitID', flat=True)))
    split_paths = list(Split.objects.filter(id__in = split_ids).values_list('SplitPath', flat=True))
    tag_list = []
    for split_id in split_ids:
        tags = list(SplitTag.objects.filter(SplitID = split_id).values_list('Tag', flat=True))
        tag_list.append(tags)
    return split_ids, split_paths, tag_list

@login_required
def video_summary(request, pk):
    video = Video.objects.get(id = pk)
    split_ids, split_paths, tag_list = get_relevant_split_data(pk)
    data_list = list(zip(split_ids, split_paths, tag_list))
    return render(request, 'summarize/video_summary.html', {
        'name': video.Name,
        'data_list': data_list
    })

def get_relevant_summary_data(pk):
    tags = list(SplitTag.objects.filter(SplitID = pk).values_list('Tag', flat=True))
    summaries = list(SplitSummary.objects.filter(SplitID = pk).values_list('Summary', flat=True))
    return tags, summaries

def split_detail(request, pk):
    split = get_object_or_404(Split, id=pk)
    split_id = split.id
    tags, summaries = get_relevant_summary_data(pk)
    cur_path = os.path.join("/media", split.SplitPath)
    return render(request, 'summarize/split_detail.html', {
        'cur_path' : cur_path,
        'tags': tags,
        'summaries': summaries
    })


def search_tag(request):
    if request.method == 'GET':
        split_ids = sorted(list(SplitTag.objects.filter(Tag = request.GET.get('search')).values_list('SplitID', flat=True)))
        video_ids = sorted(list(VideoSplit.objects.filter(SplitID__in = split_ids).values_list('VideoID', flat=True)))
        videos = Video.objects.filter(id__in = video_ids)
        paginator = Paginator(videos, 5)
        page = request.GET.get('page')
        try:
            videos = paginator.page(page)
        except PageNotAnInteger:
            videos = paginator.page(1)
        except EmptyPage:
            videos = paginator.page(paginator.num_pages)
        return render(request, 'summarize/search.html', {'videos': videos})
    else:
        return render(request,"summarize/search.html",{})
