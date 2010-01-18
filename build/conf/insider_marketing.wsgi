import os
import sys

sys.path.append("/home/taylan/sites/insidermarketing/app")
sys.path.append("/home/taylan/sites/insidermarketing/app/libs")
sys.path.append("/home/taylan/sites/insidermarketing/app/insider_marketing")

os.environ["DJANGO_SETTINGS_MODULE"] = "insider_marketing.settings"

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
