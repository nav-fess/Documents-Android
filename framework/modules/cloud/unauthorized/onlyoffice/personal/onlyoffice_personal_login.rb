# frozen_string_literal: true

# PageObject for Onlyoffice Personal Login
class OnlyofficePersonalLogin < BasePageObject
  textfield 'email', id: 'login_personal_portal_email_edit'
  textfield 'password', id: 'login_personal_portal_password_edit'
  button 'sign_in', id: 'login_personal_signin_button'
  button 'facebook', id: 'login_social_facebook_button'
  button 'google', id: 'login_social_google_button'
  text 'description', id: 'login_personal_info_text'
  button 'create_portal', id: 'login_personal_signup_button'

  def self.perform(email, password)
    email_textfield_fill email
    password_textfield_fill password
    sign_in_button_click
  end
end
