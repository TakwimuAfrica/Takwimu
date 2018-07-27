from django import forms

LOCATION = [('Tanzania', 'Tanzania'), ('Senegal', 'Senegal'), ('Nigeria', 'Nigeria')]

# todo  to be loaded from the user personae in settings

ROLES = [('investor', 'Investor'), ('NGO', 'NGO'), ('Journalist', 'Journalist')]

STYLE_CLASSES = "form-control form-control-lg rounded-0"


class SupportServicesContactForm(forms.Form):
    email = forms.CharField(
        max_length=254,
        label='Your Email',
        widget=forms.EmailInput(
            attrs={'class': STYLE_CLASSES,
                   'placeholder': 'name@email.com'}),
    )
    location  = forms.ChoiceField(
        label='Your Location', choices=LOCATION,
        widget=forms.Select(
            attrs={"class": STYLE_CLASSES}))

    role = forms.ChoiceField(
        label='What best describes your role?',
        choices=ROLES,
        widget=forms.Select(
            attrs={"class": STYLE_CLASSES}))

    help = forms.CharField(label='How can we help you?',
        widget=forms.Textarea(attrs={"class": STYLE_CLASSES, "rows": 5}) )