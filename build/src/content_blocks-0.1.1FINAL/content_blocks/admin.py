from django import forms
from django.core.urlresolvers import reverse
from django.contrib import admin

from content_blocks.models import ContentBlock
from tinymce.widgets import TinyMCE


class ContentBlockAdmin(admin.ModelAdmin):
    list_display = ('name', )
    
    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name == 'content':
            return forms.CharField(widget=TinyMCE(
                attrs={
                    'cols': 80, 
                    'rows': 30,
                },
            ))

        return super(ContentBlockAdmin, self).formfield_for_dbfield(db_field, **kwargs)


admin.site.register(ContentBlock, ContentBlockAdmin)
