from django.test import TestCase
from django.core.urlresolvers import resolve


class AccountsTest(TestCase):
    def setUp(self):
        pass

    def test_signup_page_exists(self):
        found = resolve('/accounts/signup/')
        self.assertEqual(found.view_name, 'account_signup')

    def test_user_can_create_account(self):
        response = self.client.post('/accounts/signup/',
                                    {'id_email': 'pahereza@gmail.com',
                                     'id_username': 'ahereza',
                                     'id_password': 'password256',
                                     'id_password1': 'password256'})
        self.assertEqual(response.status_code, '200')

    def test_login_page_exists(self):
        found = resolve('/accounts/login/')
        self.assertEqual(found.view_name, 'account_login')

    def test_user_can_login(self):
        response = self.client.post('/accounts/login/',
                                    {'id_login': 'pahereza@gmail.com',
                                     'id_password': 'password256'
                                     })
        self.assertEqual(response.status_code, '200')

    def test_user_with_admin_role_can_access_dashboard(self):
        self.fail('test not completed')

    def test_normal_user_can_not_access_dashboard(self):
        self.fail('test not completed')
