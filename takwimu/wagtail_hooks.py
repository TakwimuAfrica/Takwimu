from wagtail.contrib.modeladmin.options import modeladmin_register, ModelAdminGroup, ModelAdmin
from hurumap.models import DataIndicator, DataIndicatorPublisher


class DataIndicatorAdmin(ModelAdmin):
    model = DataIndicator
    menu_label = 'Data Indicator'
    menu_icon = 'doc-full-inverse'
    list_display = ('title', 'description')
    search_fields = ('title', 'description')


class DataPublisherAdmin(ModelAdmin):
    model = DataIndicatorPublisher
    menu_label = 'Indicator Publisher'
    menu_icon = 'doc-full-inverse'
    list_display = ('name', 'url')
    search_fields = ('name')


class DataAdminGroup(ModelAdminGroup):
    menu_label = 'Data'
    menu_icon = 'folder-open-inverse'
    menu_order = 200
    items = (DataIndicatorAdmin, DataPublisherAdmin)


modeladmin_register(DataAdminGroup)