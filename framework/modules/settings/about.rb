# frozen_string_literal: true

# PageObject for About
class About < BasePageObject
  button 'terms', id: 'about_terms'
  button 'policy', id: 'about_policy'
  button 'license', id: 'about_license'
  button 'website', id: 'about_website'
  button 'browser', xpath: '//android.widget.TextView'

  text 'terms_url', xpath: '//android.widget.EditText'
  text 'privacy_policy_url', xpath: '//android.widget.EditText'
  text 'apache_license_url', xpath: "//android.view.View[@index='2']"
  text 'website_url', xpath: '//android.widget.EditText'
end
