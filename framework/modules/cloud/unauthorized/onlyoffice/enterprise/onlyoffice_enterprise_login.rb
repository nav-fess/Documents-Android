# frozen_string_literal: true

# PageObject for Onlyoffice Enterprise Login
class OnlyofficeEnterpriseLogin < BasePageObject
  textfield 'portal_address', id: 'login_enterprise_portal_edit'
  button 'next', id: 'login_enterprise_next_button'
  text 'description', id: 'login_enterprise_forgot_pwd_button'
  button 'create_portal', id: 'login_enterprise_create_button'

  textfield 'email', id: 'login_enterprise_portal_email_edit'
  textfield 'password', id: 'login_enterprise_portal_password_edit'
  button 'toggle_password', id: 'text_input_password_toggle'
  button 'sign_in', id: 'login_enterprise_signin_button'
  button 'facebook', id: 'login_social_facebook_button'
  textfield 'fb_login', xpath: "//android.widget.EditText[@index='0']"
  textfield 'fb_pass', xpath: "//android.widget.EditText[@index='1']"
  button 'fb_log_in', xpath: '//android.widget.Button'
  button 'continue', xpath: "//android.widget.Button[@text='Continue']"

  button 'google', id: 'login_social_google_button'
  button 'google_account', xpath: "//android.widget.LinearLayout[@index='0']"
  button 'forgot_password', id: 'login_enterprise_forgot_pwd_button'

  def self.perform(portal_address, email, password)
    portal_address_textfield_fill portal_address
    next_button_click
    email_textfield_fill email
    password_textfield_fill password
    sign_in_button_click
  end
end
