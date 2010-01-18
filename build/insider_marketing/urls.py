from django.conf.urls.defaults import *
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    (r'^admin/', include(admin.site.urls)),
    
    # Home
    url(r"^$", "django.views.generic.simple.direct_to_template", {
        "template": "home.html",
    }, name="home"),
    
    # About
    url(r"^about/$", "django.views.generic.simple.direct_to_template", {
        "template": "about.html",
    }, name="about"),
    
    # Contact
    url(r"^contact/$", "django.views.generic.simple.direct_to_template", {
        "template": "contact.html",
    }, name="contact"),
    
    # Promise
    url(r"^promise/$", "django.views.generic.simple.direct_to_template", {
        "template": "promise.html",
    }, name="promise"),
    
    # Portfolio
    url(r"^portfolio/$", "django.views.generic.simple.direct_to_template", {
        "template": "portfolio.html",
    }, name="portfolio"),
    
    # Marketing
    url(r"^marketing/$", "django.views.generic.simple.direct_to_template", {
        "template": "marketing.html",
    }, name="marketing"),
    
    # Testimonials
    url(r"^testimonials/$", "django.views.generic.simple.direct_to_template", {
        "template": "testimonials.html",
    }, name="testimonials"),
    
    # Team
    url(r"^team/$", "django.views.generic.simple.direct_to_template", {
        "template": "team.html",
    }, name="team"),
)
