from __future__ import absolute_import
import os
import logging
import random

from django.views.generic.list import ListView
from django.views.generic.base import TemplateView
from django.conf import settings

from structure.models import Node
from .models import Snippet, HomePageImage


# Get an instance of a logger
logger = logging.getLogger('ascent_jet.custom')


class IndexView(ListView):
    model = Node
    template_name = 'index.html'

    def get_context_data(self, *args, **kwargs):
        context = super(IndexView, self).get_context_data(*args, **kwargs)
        context['snippets'] = Snippet.objects.all()
        try:
            context['hero_image'] = random.choice(HomePageImage.objects.filter(header=True))
            context['body_image'] = HomePageImage.objects.filter(body=True)[0]
        except:
            pass
        return context

index = IndexView.as_view()


class CommonPreview(TemplateView):

    def get_template_names(self):
        preview_folder = os.environ.get('PREVIEW_DIR', False)

        logger.info("Get template name")
        logger.info("base dir: {}".format(settings.BASE_DIR))
        logger.info("os.walk: {}".format(os.walk(settings.BASE_DIR + '/ascent_jet/common/templates/preview/')))
        logger.info("debug: %s, preview folder: %s" % (settings.DEBUG, preview_folder))

        for root, dirs, files in os.walk(preview_folder):
            logger.info("root: {}. dirs: {}. files: {}.".format(root, dirs, files))
            for drs in dirs:
                if self.kwargs.get('appname', None) == drs:
                    fpath = self.kwargs['appname']
                    if self.kwargs.get('tname', None):
                        fpath += '/' + self.kwargs['tname']
                    else:
                        fpath += '/index'
                else:
                    fpath = self.kwargs['appname']
                logger.info("fpath: {}".format(fpath))
                return 'preview/{}.html'.format(fpath)
        logger.info("template: %s" % (format(self.kwargs['appname'])))
        return 'preview/{}/index.html'.format(self.kwargs['appname'])

show_template = CommonPreview.as_view()


class PreviewView(TemplateView):

    def get_template_names(self):
        return 'old_preview.html'

preview = PreviewView.as_view()

class ProfileView(TemplateView):
   template_name = "profile.html"

profile = ProfileView.as_view()

class OfferRequestView(TemplateView):
   template_name = "offer-request.html"

offer_request = OfferRequestView.as_view()

class AccountView(TemplateView):
   template_name = "account.html"

account = AccountView.as_view()
