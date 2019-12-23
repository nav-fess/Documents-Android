# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'

# Class contains data help methods for login on a portal
class Login
  def self.login_complete(url, email, password)
    before_login
    if url.eql? 'personal'
      login_onlyoffice_personal(email: email, password: password)
    else
      login_onlyoffice_enterprise(url: url, email: email, password: password)
    end
    find_accounts
  end

  def self.before_login
    click id: ID::SKIP_ONBOARDING, time: 5
    click id: ID::CLOUDS
  end

  def self.login_onlyoffice_personal(email:, password:)
    open_onlyoffice_connect
    open_personal_section
    fill_personal_email email
    fill_personal_password password
    tab_personal_sign_in
  end

  def self.login_onlyoffice_enterprise(url:, email:, password:)
    open_onlyoffice_connect
    open_enterprise_section
    fill_enterprise_portal_address url
    open_enterprise_account_form
    fill_enterprise_email email
    fill_enterprise_password password
    click_enterprise_sign_in
  end

  def self.find_accounts
    element id: ID::ACCOUNTS, pause: 7
  end

  def self.login_facebook(email_fb, p_fb)
    click id: ID::FACEBOOK
    fill_form textfield: IndexUI::FACEBOOK_LOGIN, data: email_fb, pause: 5
    fill_form textfield: IndexUI::FACEBOOK_PASS, data: p_fb
    click button: IndexUI::FACEBOOK_NEXT
    click button: IndexUI::FACEBOOK_CONTINUE, pause: 5
    find_accounts
  end

  def self.login_google
    click id: ID::GOOGLE
    click text: IndexUI::GOOGLE_USER, pause: 3
    find_accounts
  end

  def self.login_cloud(portal, login, pass)
    fill_form id: ID::CLOUD_NAME,  data: portal
    fill_form id: ID::CLOUD_LOGIN, data: login
    fill_form id: ID::CLOUD_PASS,  data: pass
    click     id: ID::CLOUD_SAVE
  end

  def self.open_onlyoffice_connect
    click id: ID::CLOUDS_MENU_ITEM
  end

  def self.open_enterprise_section
    click xpath: Xpath::ENTERPRISE_SECTION
  end

  def self.fill_enterprise_portal_address(address)
    fill_form id: ID::ENTERPRISE_PORTAL, data: address
  end

  def self.open_enterprise_account_form
    click id: ID::ENTERPRISE_NEXT
  end

  def self.fill_enterprise_email(email)
    fill_form id: ID::ENTERPRISE_EMAIL, data: email
  end

  def self.fill_enterprise_password(password)
    fill_form id: ID::ENTERPRISE_PASSWORD, data: password
  end

  def self.click_enterprise_sign_in
    click id: ID::ENTERPRISE_SIGN_IN
  end

  def self.open_personal_section
    click xpath: Xpath::PERSONAL_SECTION
  end

  def self.fill_personal_email(email)
    fill_form id: ID::PERSONAL_EMAIL, data: email
  end

  def self.fill_personal_password(password)
    fill_form id: ID::PERSONAL_PASSWORD, data: password
  end

  def self.tab_personal_sign_in
    click id: ID::PERSONAL_SIGN_IN
  end

  def self.tap_personal_tab
    click text: IndexUI::PERSONAL_TAB, pause: 2
  end

  def self.tap_on_nextcloud
    click id: ID::NEXTCLOUD
  end

  def self.tap_on_owncloud
    click id: ID::OWNCLOUD
  end

  def self.tap_on_webdav_cloud
    click id: ID::WEBDAV
  end
end
