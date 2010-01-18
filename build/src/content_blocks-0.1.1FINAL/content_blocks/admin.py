from django.contrib import admin

from content_blocks.models import ContentBlock


class ContentBlockAdmin(admin.ModelAdmin):
    list_display = ('name', )


admin.site.register(ContentBlock, ContentBlockAdmin)