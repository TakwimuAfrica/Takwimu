from wagtail.contrib.modeladmin.options import modeladmin_register, ModelAdminGroup, ModelAdmin
from takwimu.models import DataInd, DataPublisher, DataValue


class DataIndicatorAdmin(ModelAdmin):
    model = DataInd
    menu_label = 'Indicator'
    menu_icon = 'doc-full-inverse'
    list_display = 'title'
    search_fields = 'title'


class DataPublisherAdmin(ModelAdmin):
    model = DataPublisher
    menu_label = 'Publisher'
    menu_icon = 'doc-full-inverse'
    list_display = 'name'
    search_fields = 'name'


class DataValueAdmin(ModelAdmin):
    model = DataValue
    menu_label = 'Values'
    menu_icon = 'doc-full-inverse'
    list_display = 'title'
    search_fields = 'title'


class DataAdminGroup(ModelAdminGroup):
    menu_label = 'Data'
    menu_icon = 'folder-open-inverse'
    menu_order = 200
    items = (DataIndicatorAdmin, DataValueAdmin, DataPublisherAdmin)

modeladmin_register(DataAdminGroup)


