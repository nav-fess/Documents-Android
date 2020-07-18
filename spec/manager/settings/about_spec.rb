# frozen_string_literal: true

require 'spec_helper'

describe About, :settings do
  before :all do
    Onboarding.skip_button_click
  end

  it 'About :Tap button about' do
    BottomNavigationBar.profile_button_click delay: 3
    Account.settings_button_click delay: 3
    Settings.about_button_click
  end

  it 'About : Check url terms' do
    About.terms_button_click delay: 2
    terms_url = About.terms_url_text_value
    expect(terms_url).to include Consts::About::TERMS_OF_USE

    back
  end

  it 'About : Check url Privacy Policy' do
    About.policy_button_click delay: 2
    privacy_policy_url = About.privacy_policy_url_text_value
    expect(privacy_policy_url).to include Consts::About::PRIVACY_POLICY
    back
  end

  it 'About : Check url Apache License ' do
    About.license_button_click delay: 2
    apache_license_url = About.apache_license_url_texts[1].attribute('content-desc')
    expect(apache_license_url).to include Consts::About::LICENSE
    back
  end

  it 'About : Check url website Onlyoffice' do
    About.website_button_click delay: 2
    apache_license_url = About.website_url_text_value
    expect(apache_license_url).to include Consts::About::WEBSITE
    back
  end
end
