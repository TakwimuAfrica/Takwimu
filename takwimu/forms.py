from django import forms

LOCATION = ['Tanzania', 'Nigeria', 'Senegal']


class SupportServicesContactForm(forms.Form):
    email = forms.CharField(
        max_length=254,
        label='Your Email',
        help_text='name@email.com',
        widget=forms.EmailInput(
            attrs={'class': "form-control form-control-lg rounded-0"}),
    )
    location  = forms.ChoiceField(
        label='Your Location', choices=LOCATION,
        widget=forms.Select(
            attrs={"class":"form-control form-control-lg rounded-0"}))

    role = forms.ChoiceField(
        label='What best describes your role?',
        choices=LOCATION,
        widget=forms.Select(
            attrs={"class":"form-control form-control-lg rounded-0"}))

    help = ""