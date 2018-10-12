require_relative '../../features/support/hooks.rb'

def search_data_portal(domen_name, attribute)
  data = FileLoginConfig.data_portal(domen_name)
  data[attribute]
end

Given(/^Tap on the tab Portall$/) do
  find_element(id: 'tab_layout')
    .find_element(xpath: "//android.widget.TextView[@text='PORTAL']").click
end

And(/^Tap on the button Next$/) do
  find_element(id: 'login_enterprise_next_button').click
end

And(/^Enter login in (.*)$/) do |domen|
  login = search_data_portal(domen, 'l')
  find_element(id: 'login_enterprise_portal_email_edit').send_keys(login)
end

And(/^Enter password (.*)$/) do |domen|
  password =  search_data_portal(domen, 'p')
  find_element(id: 'login_enterprise_portal_password_edit').send_keys(password)
end

And(/^Tap on the  button Next$/) do
  find_element(id: 'login_enterprise_signin_button').click
end

Then(/^Tap on the button About$/) do
  find_element(id: 'app_bar_layout')
    .find_element(xpath: "//android.widget.ImageButton[@index='0']").click
end

Given(/^click on Skip button$/) do
  find_element(id: 'on_boarding_panel_skip_button').click
end

When(/^Enter (.*) portal$/) do |domen|
  data = search_data_portal(domen, 'portal')
  find_element(id: 'login_enterprise_portal_edit').send_keys(data)
end

# login personal portal
Given(/^Tap on the tab Personal$/) do
  find_element(id: 'tab_layout')
    .find_element(xpath: "//android.widget.TextView[@text='PERSONAL']").click
end

And(/^Input login in pesonal portal (.*)$/) do |domen_personal|
  data = search_data_portal(domen_personal, 'l')
  find_element(id: 'login_personal_portal_email_edit').send_keys(data)
end

And(/^Input password in personal portal  (.*)$/) do |domen_personal|
  data = search_data_portal(domen_personal, 'p')
  find_element(id: 'login_personal_portal_password_edit').send_keys(data)
end

And(/^Tap on the button Sing In$/) do
  find_element(id: 'login_personal_signin_button').click
end

# login personal portal through google
# google
And(/^Tap on the google button$/) do
  find_element(id: 'login_social_google_button').click
end

And(/^Tap on the account profile google$/) do
  find_element(xpath: "//android.widget.LinearLayout[@index='1']").click
end

# facebook
And(/^Tap on the facebook button$/) do
  find_element(id: 'login_social_facebook_button').click
end

And(/^Input data facebook account $/) do
  pending
end

And(/^Tap on the account profile facebook$/) do
  pending
end
