from wagtail.contrib.modeladmin.options import modeladmin_register, ModelAdminGroup, ModelAdmin
from hurumap.models import DataIndicator, DataIndicatorPublisher

from takwimu.models.dashboard import Service, AboutPage, ContactUsPage, ExplainerSteps, FAQ, Testimonial


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
    model = Service
    menu_label = 'Support Services'
    menu_icon = 'help'
    list_display = ('title', 'category',)


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


class ExplainerStepsAdmin(ModelAdmin):
    model = ExplainerSteps
    menu_icon = 'list-ul'
    menu_label = 'Explainer Steps'
    menu_order = 500
    
class FAQAdmin(ModelAdmin):
    model = FAQ
    menu_label = 'FAQ'
    menu_icon = 'help'
    menu_order = 400

class TestimonialAdmin(ModelAdmin):
    model = Testimonial
    menu_label = 'Testimonials'
    menu_icon = 'openquote'
    menu_order = 600
    list_display = ('name', 'title', 'quote')

    
modeladmin_register(DataAdminGroup)
# modeladmin_register(AboutUsAdminGroup)

modeladmin_register(SupportServicesAdmin)
modeladmin_register(ExplainerStepsAdmin)
modeladmin_register(FAQAdmin)
modeladmin_register(TestimonialAdmin)
