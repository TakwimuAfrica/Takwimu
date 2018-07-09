from wagtail.contrib.modeladmin.options import modeladmin_register, ModelAdminGroup, ModelAdmin
from hurumap.models import DataIndicator, DataIndicatorPublisher
from takwimu.models.dashboard import SupportService, AboutPage, ContactUsPage, Testimonial, FAQ


class DataPublisherAdmin(ModelAdmin):
    model = DataIndicatorPublisher
    menu_label = 'Publishers'
    menu_icon = 'group'
    list_display = ('name', 'url')
    search_fields = ('name')

class DataIndicatorAdmin(ModelAdmin):
    model = DataIndicator
    menu_label = 'Indicators'
    menu_icon = 'table'
    list_display = ('title', 'description')
    search_fields = ('title', 'description')
    form_fields_exclude = ('view', 'process_prefs', 'data_values', 'publisher_data')


class DataAdminGroup(ModelAdminGroup):
    menu_label = 'Data'
    menu_icon = 'folder-open-inverse'
    menu_order = 200
    items = (DataPublisherAdmin, DataIndicatorAdmin)


class SupportServicesAdmin(ModelAdmin):
    model = SupportService
    menu_label = 'Support Services'
    menu_icon = 'help'
    list_display = ('title',)


class AboutPageAdmin(ModelAdmin):
    model = AboutPage
    menu_label = 'About Page'
    menu_icon = 'help'
    list_display = ('title', )


class ContactUsPageAdmin(ModelAdmin):
    model = ContactUsPage
    menu_label = 'Contact Us Page'
    menu_icon = 'mail'
    list_display = ('title',)


class AboutUsAdminGroup(ModelAdminGroup):
    menu_label = 'About Us'
    menu_icon = 'folder-open-inverse'
    menu_order = 300
    items = (AboutPageAdmin, ContactUsPageAdmin)


class FAQAdmin(ModelAdmin):
    model = FAQ
    menu_label = 'FAQ'
    menu_icon = 'help'
    menu_order = 400

    
class TestimonialAdmin(ModelAdmin):
    model = Testimonial
    menu_label = 'Testimonials'
    menu_icon = 'group'
    menu_order = 600


modeladmin_register(SupportServicesAdmin)

modeladmin_register(DataAdminGroup)

modeladmin_register(AboutUsAdminGroup)

modeladmin_register(TestimonialAdmin)

modeladmin_register(FAQAdmin)

