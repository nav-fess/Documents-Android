require_relative '../../features/support/hooks.rb'

def searchDataPortal(domenName, attribute)
  indexPortalData = $fileLoginConfig.index{|dataPortal| dataPortal["domen"].include? domenName}
  file = File.open("/home/nav/RubymineProjects/cucumber/features/login_tests/file.txt","w")
  file.write("index = #{indexPortalData}")
  file.write("svoistvo = #{ $fileLoginConfig[indexPortalData][attribute]}")
  $fileLoginConfig[indexPortalData][attribute]
end

Given(/^Tap on the tab Portall$/) do
  find_element(id:"tab_layout").find_element(xpath:"//android.widget.TextView[@text='PORTAL']").click
end

And(/^Tap on the button Next$/) do
  find_element(id:"login_enterprise_next_button").click
end

And(/^Enter login in (.*)$/) do |domen|
  login = searchDataPortal(domen,"l")
  find_element(id:"login_enterprise_portal_email_edit").send_keys(login)
end

And(/^Enter password (.*)$/) do |domen|
  password =  searchDataPortal(domen, "p")
  find_element(id:"login_enterprise_portal_password_edit").send_keys(password)
end

And(/^Tap on the  button Next$/) do
  find_element(id:"login_enterprise_signin_button").click
end

Then(/^Tap on the button About$/) do
  if exists {find_element(id:"app_bar_layout").find_element(xpath:"//android.widget.TextView[@text='MY']")}
    find_element(id:"app_bar_layout").find_element(xpath:"//android.widget.TextView[@text='MY']").click
  else
    fail("Button About does not exist")
  end
end

Given(/^click on Skip button$/) do
  find_element(id:"on_boarding_panel_skip_button").click
end

When(/^Enter (.*) portal$/) do |domen|
  namePortal = searchDataPortal(domen, "portal")
  find_element(id:"login_enterprise_portal_edit").send_keys(namePortal)
end

#login personal portal

Given(/^Tap on the tab Personal$/) do
  find_element(id:"tab_layout").find_element(xpath:"//android.widget.TextView[@text='PERSONAL']").click
end

And(/^Input login in pesonal portal (.*)$/) do |domenPersonal|
  login = searchDataPortal(domenPersonal,"l")
  find_element(id:"login_personal_portal_email_edit").send_keys(login)
end

And(/^Input password in personal portal  (.*)$/) do |domenPersonal|
  login = searchDataPortal(domenPersonal,"p")
  find_element(id:"login_personal_portal_password_edit").send_keys(login)
end

And(/^Tap on the button Sing In$/) do
  find_element(id:"login_personal_signin_button").click
end

#login personal portal through google

And(/^Cick on the google butto$/) do
  find_element(id:"login_social_google_button").click
end