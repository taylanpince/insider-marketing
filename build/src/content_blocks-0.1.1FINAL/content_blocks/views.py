from django.conf import settings
from django.contrib.auth.decorators import permission_required
from django.views.generic import simple

from content_blocks.forms import ContentBlockForm
from content_blocks.models import ContentBlock
from content_blocks.utils import get_admin_edit_page


@permission_required("content_blocks.contentblock")
def edit(request, name):
    """
    Edit view for a ContentBlock object, creates the block if it doesn't exist
    """
    block, __unused__ = ContentBlock.objects.get_or_create(name=name)

    if request.is_ajax():
        if request.method == "POST":
            form = ContentBlockForm(request.POST, instance=block)

            if form.is_valid():
                block = form.save()

                return simple.direct_to_template(request, "content_blocks/block.html", extra_context={
                    "block": block,
                    "editable": True,
                    "markup": True,
                    "DEBUG": settings.DEBUG,
                })
        elif request.GET.has_key("cancel"):
            return simple.direct_to_template(request, "content_blocks/block.html", extra_context={
                "block": block,
                "editable": True,
                "markup": True,
                "DEBUG": settings.DEBUG,
            })
        else:
            form = ContentBlockForm(instance=block)

        return simple.direct_to_template(request, "content_blocks/edit.html", extra_context={
            "form": form,
            "block": block,
        })
    else:
        return simple.redirect_to(request, get_admin_edit_page(block))
