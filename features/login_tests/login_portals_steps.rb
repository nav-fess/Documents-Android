=begin
Given(/^I land on help popup$/) do
  find_element(id:"fab").click
end

When(/^I click on Got it button$/) do
  find_element(id:"on_boarding_panel_skip_button").click
  # sleep 100
  find_element(id:"tab_layout").find_element(xpath:"//android.widget.TextView[@text='PERSONAL']").click
  #sleep 100
end

Then(/^I land on Area screen$/) do
  text("Area")
end

When(/^I click on Swap button$/) do
  find_element(id:"fab").click
end

Then(/^I see "([^"]*)" in From header$/) do |value|
  actual_value = find_element(id:"header_text_unit_from").text
  puts("Expected value = #{value}")
  puts("Actual value = #{actual_value}")
end

And(/^I see "([^"]*)" in To header$/) do |value|
  actual_value = find_element(id:"header_value_to").text
  puts("Expected value = #{value}")
  puts("Actual value = #{actual_value}")
end

And(/^I click on Clear button$/) do
  find_element(id:"login_enterprise_portal_edit").send_keys("personal.teamlab.info")
end

When(/^I enter "([^"]*)" to from field$/) do |value|
  puts("User entered value #{value} ")
end

Then(/^I get "([^"]*)" in to field$/) do |value|
  puts("User sees #{value} in result field")
end

And(/^I  see "([^"]*)" in To header$/) do |value|
  puts("From header values is " + value)
end
=end
#------------------------------------------------

Given(/^Tap on the tab Portall$/) do
  find_element(id:"tab_layout").find_element(xpath:"//android.widget.TextView[@text='PORTAL']").click
end

When(/^Enter (.*) portal$/) do |name_portal|
  find_element(id:"login_enterprise_portal_edit").send_keys(name_portal)
end

And(/^Tap on the button Next$/) do
 !!! find_element(id:"login_enterprise_next_button").click
end

And(/^Enter login (.*)$/) do |login|
  find_element(id:"login_enterprise_portal_email_edit").send_keys(login)
end

And(/^Enter password (.*)$/) do |password|
  find_element(id:"login_enterprise_portal_password_edit").send_keys(password)
end

And(/^Tap on the  button Sing In$/) do
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