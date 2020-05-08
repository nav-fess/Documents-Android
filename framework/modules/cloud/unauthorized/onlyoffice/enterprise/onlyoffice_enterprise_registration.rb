# frozen_string_literal: true

# PageObject for Onlyoffice Enterprise Registration
class OnlyofficeEnterpriseRegistration < BasePageObject
  textfield 'portal_name', id: 'login_create_portal_address_edit'
  text 'hint', id: 'login_create_portal_address_hint_end'
  textfield 'email', id: 'login_create_portal_email_edit'
  textfield 'first_name', id: 'login_create_portal_first_name_edit'
  textfield 'last_name', id: 'login_create_portal_last_name_edit'
  button 'next', id: 'login_signin_create_portal_button'

  textfield 'password', id: 'login_signin_password_edit'
  textfield 'password_repeat', id: 'login_signin_repeat_edit'
  button 'sign_in', id: 'login_signin_create_portal_button'
end
