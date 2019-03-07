# -*- coding: utf-8 -*-
# Generated by Django 1.11.18 on 2019-03-04 06:30
from __future__ import unicode_literals

from django.db import migrations
import takwimu.models.dashboard
import wagtail.wagtailcore.blocks
import wagtail.wagtailcore.fields
import wagtail.wagtaildocs.blocks
import wagtail.wagtailembeds.blocks
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('takwimu', '0045_profilepage_meta'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profilepage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'topic', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'icon', takwimu.models.dashboard.IconChoiceBlock(required=False)), (b'summary', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'indicators', wagtail.wagtailcore.blocks.StreamBlock([(b'indicators', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'widgets', wagtail.wagtailcore.blocks.StreamBlock([(b'free_form', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'snippet', template=b'takwimu/_includes/dataview/freeform.html')), (b'data_indicator', takwimu.models.dashboard.DataIndicatorChooserBlock()), (b'embed', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'media', template=b'takwimu/_includes/dataview/embed.html')), (b'document', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'doc-full', template=b'takwimu/_includes/dataview/document.html')), (b'image', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'image', template=b'takwimu/_includes/dataview/image.html')), (b'html', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'raw_html', wagtail.wagtailcore.blocks.RawHTMLBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'code', template=b'takwimu/_includes/dataview/code.html')), (b'hurumap', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'subtitle', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'data_country', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'ET', b'Ethiopia'), (b'KE', b'Kenya'), (b'NG', b'Nigeria'), (b'SN', b'Senegal'), (b'TZ', b'Tanzania')], label=b'Country')), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'data_id', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'demographics-residence_dist', b'Population by Residence'), (b'demographics-sex_dist', b'Population by Sex'), (b'crops-crop_distribution', b'Crops Produced'), (b'health_centers-prevention_methods_dist', b'Knowledge of HIV Prevention Methods'), (b'education-education_reached_distribution', b'Highest Level of Education Attained'), (b'education-school_attendance_distribution', b'School Attendance by Sex'), (b'donors-donor_assistance_dist', b'Principal Donors'), (b'poverty-poverty_residence_dist', b'Percentage of Population living in Poverty by Residence'), (b'poverty-poverty_age_dist', b'Percentage of Population living in Poverty by Age and Residence'), (b'fgm-fgm_age_dist', b'Percentage of Women that have undergone FGM by Age'), (b'security-seized_firearms_dist', b'Seized Firearms'), (b'donors-donor_programmes_dist', b'Donor Funded Programmes'), (b'budget-government_expenditure_dist', b'Government Expenditure'), (b'health_centers-health_centers_dist', b'Number of health centers by type')], label=b'Data')), (b'chart_type', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'histogram', b'Histogram'), (b'pie', b'Pie Chart'), (b'grouped_column', b'Grouped Column')], label=b'Chart Type')), (b'data_stat_type', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'percentage', b'Percentage'), (b'scaled-percentage', b'Scaled Percentage'), (b'dollar', b'Dollar')], label=b'Stat Type')), (b'data_source_link', wagtail.wagtailcore.blocks.URLBlock(label=b'Source URL', required=False)), (b'data_source_title', wagtail.wagtailcore.blocks.CharBlock(label=b'Source Title', required=False)), (b'chart_qualifier', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'h5', b'h6', b'ol', b'ul', b'bold', b'italic', b'hr', b'link'], help_text=b'Chart context e.g. legend, universe, etc.', label=b'Chart Qualifier', required=False)), (b'chart_height', wagtail.wagtailcore.blocks.IntegerBlock(help_text=b'Default is 300px', label=b'Chart Height', required=False)), (b'widget_height', wagtail.wagtailcore.blocks.IntegerBlock(help_text=b'Default is 450px', label=b'Widget Height', required=False))], icon=b'code', template=b'takwimu/_includes/dataview/hurumap.html')), (b'entities', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'entities', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'name', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'description', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))]))), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'group', template=b'takwimu/_includes/dataview/entities.html'))], required=False))], required=False))], required=False))]))], blank=True),
        ),
        migrations.AlterField(
            model_name='profilesectionpage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'topic', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'icon', takwimu.models.dashboard.IconChoiceBlock(required=False)), (b'summary', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'indicators', wagtail.wagtailcore.blocks.StreamBlock([(b'indicators', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'widgets', wagtail.wagtailcore.blocks.StreamBlock([(b'free_form', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'snippet', template=b'takwimu/_includes/dataview/freeform.html')), (b'data_indicator', takwimu.models.dashboard.DataIndicatorChooserBlock()), (b'embed', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'media', template=b'takwimu/_includes/dataview/embed.html')), (b'document', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'doc-full', template=b'takwimu/_includes/dataview/document.html')), (b'image', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'image', template=b'takwimu/_includes/dataview/image.html')), (b'html', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'raw_html', wagtail.wagtailcore.blocks.RawHTMLBlock(required=False)), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'code', template=b'takwimu/_includes/dataview/code.html')), (b'hurumap', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'subtitle', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'data_country', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'ET', b'Ethiopia'), (b'KE', b'Kenya'), (b'NG', b'Nigeria'), (b'SN', b'Senegal'), (b'TZ', b'Tanzania')], label=b'Country')), (b'sdg', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'', b'Please select an SDG'), ('no-poverty', 'No Poverty'), ('zero-hunger', 'Zero Hunger'), ('good-health-and-well-being', 'Good Health and Well-being'), ('quality-education', 'Quality Education'), ('gender-equality', 'Gender Equality'), ('clean-water-and-sanitation', 'Clean Water and Sanitation'), ('affordable-and-clean-energy', 'Affordable and Clean Energy'), ('decent-jobs-and-economic-growth', 'Decent Jobs and Economic Growth'), ('industry-innovation-and-infrastructure', 'Industry, Innovation and Infrastructure'), ('reduced-inequalities', 'Reduced Inequalities'), ('sustainable-cities-and-communities', 'Sustainable Cities and Communities'), ('responsible-consumption-and-production', 'Responsible Consumption and Production'), ('climate-action', 'Climate Action'), ('life-below-water', 'Life Below Water'), ('life-on-land', 'Life on Land'), ('peace-and-justice-strong-institutions', 'Peace and Justice - Strong Institutions'), ('partnerships-for-the-goals', 'Partnerships for the Goals')], label=b'SDG Goal', required=False)), (b'data_id', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'demographics-residence_dist', b'Population by Residence'), (b'demographics-sex_dist', b'Population by Sex'), (b'crops-crop_distribution', b'Crops Produced'), (b'health_centers-prevention_methods_dist', b'Knowledge of HIV Prevention Methods'), (b'education-education_reached_distribution', b'Highest Level of Education Attained'), (b'education-school_attendance_distribution', b'School Attendance by Sex'), (b'donors-donor_assistance_dist', b'Principal Donors'), (b'poverty-poverty_residence_dist', b'Percentage of Population living in Poverty by Residence'), (b'poverty-poverty_age_dist', b'Percentage of Population living in Poverty by Age and Residence'), (b'fgm-fgm_age_dist', b'Percentage of Women that have undergone FGM by Age'), (b'security-seized_firearms_dist', b'Seized Firearms'), (b'donors-donor_programmes_dist', b'Donor Funded Programmes'), (b'budget-government_expenditure_dist', b'Government Expenditure'), (b'health_centers-health_centers_dist', b'Number of health centers by type')], label=b'Data')), (b'chart_type', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'histogram', b'Histogram'), (b'pie', b'Pie Chart'), (b'grouped_column', b'Grouped Column')], label=b'Chart Type')), (b'data_stat_type', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'percentage', b'Percentage'), (b'scaled-percentage', b'Scaled Percentage'), (b'dollar', b'Dollar')], label=b'Stat Type')), (b'data_source_link', wagtail.wagtailcore.blocks.URLBlock(label=b'Source URL', required=False)), (b'data_source_title', wagtail.wagtailcore.blocks.CharBlock(label=b'Source Title', required=False)), (b'chart_qualifier', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'h5', b'h6', b'ol', b'ul', b'bold', b'italic', b'hr', b'link'], help_text=b'Chart context e.g. legend, universe, etc.', label=b'Chart Qualifier', required=False)), (b'chart_height', wagtail.wagtailcore.blocks.IntegerBlock(help_text=b'Default is 300px', label=b'Chart Height', required=False)), (b'widget_height', wagtail.wagtailcore.blocks.IntegerBlock(help_text=b'Default is 450px', label=b'Widget Height', required=False))], icon=b'code', template=b'takwimu/_includes/dataview/hurumap.html')), (b'entities', wagtail.wagtailcore.blocks.StructBlock([(b'label', wagtail.wagtailcore.blocks.CharBlock(help_text=b"This widget's tab label on the indicator", required=False)), (b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'entities', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'name', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'description', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))]))), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'group', template=b'takwimu/_includes/dataview/entities.html'))], required=False))], required=False))], required=False))]))], blank=True),
        ),
    ]
