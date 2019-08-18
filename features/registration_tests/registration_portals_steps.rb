require_relative '../../features/support/hooks.rb'

def search_data_regestration_portal(domen_name, attribute)
  data = FileLoginConfig.data_regestration_portal(domen_name)
  data[attribute]
end

Given (/^Change localization (.*)$/) do |portal|
  loc = search_data_regestration_portal("portaleu","local" )
  execute_script("mobile:shell",{"command"=>"am broadcast -a com.android.intent.action.SET_LOCALE --es com.android.intent.extra.LOCALE #{loc}"})
end

And(/^Tap on the tab Create Portall$/) do
  find_element(id:"login_enterprise_create_button").click
end

And(/^Input address (.*)$/) do |portal|
  address = search_data_regestration_portal(portal,"portal" )
  find_element(id:"login_create_portal_address_edit").send_keys(address)
end

And(/^Input email for (.*)$/) do |portal|
  email =  search_data_regestration_portal(portal,"email" )
  find_element(id:"login_create_portal_email_layout").send_keys(email)
end

And(/^Input first name for (.*)$/) do |portal|
  first_name =  search_data_regestration_portal(portal,"first_name" )
  find_element(id:"login_create_portal_first_name_edit").send_keys(first_name)
end

And(/^Input last name for (.*)$/) do |portal|
  last_name =  search_data_regestration_portal(portal,"last_name" )
  find_element(id:"login_create_portal_last_name_edit").send_keys(last_name)
end

And(/^Tap on the button Next registration$/) do
  find_element(id:"login_signin_create_portal_button").click
end

And(/^Input password for registration (.*)$/) do |portal|
  pass =  search_data_regestration_portal(portal,"p" )
  find_element(id:"login_signin_password_edit").send_keys(pass)
end

And(/^Repeat password for registration (.*)$/) do |portal|
  pass =  search_data_regestration_portal(portal,"p" )
  find_element(id:"login_signin_repeat_edit").send_keys(pass)
end

When(/^Tap on the button Create$/) do
  find_element(id:"login_signin_create_portal_button").click
end