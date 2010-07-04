from django.conf.urls.defaults import *
from django.contrib import admin


admin.autodiscover()


urlpatterns = patterns('',
    # Admin
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
    
    # Services
    url(r"^services/$", "django.views.generic.simple.direct_to_template", {
        "template": "services.html",
    }, name="services"),
    
    # What We Do
    url(r"^what-we-do/$", "django.views.generic.simple.direct_to_template", {
        "template": "what_we_do.html",
    }, name="what_we_do"),
    
    # Current Projects
    url(r"^current-projects/$", "django.views.generic.simple.direct_to_template", {
        "template": "current_projects.html",
    }, name="current_projects"),
    
    # Giving Back
    url(r"^giving-back/$", "django.views.generic.simple.direct_to_template", {
        "template": "giving_back.html",
    }, name="giving_back"),
    
    # Testimonials
    url(r"^testimonials/$", "django.views.generic.simple.direct_to_template", {
        "template": "testimonials.html",
    }, name="testimonials"),
    
    # Team
    url(r"^team/$", "django.views.generic.simple.direct_to_template", {
        "template": "team.html",
    }, name="team"),
)
