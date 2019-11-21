# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'
include AppiumExtension

# Class contains data help methods for login on a portal
class Login
  def self.login_complete(domain)
    before_login
    click id: ID::CLOUDS_MENU_ITEM
    if domain.eql? 'personal'
      logn_personal(domain)
    else
      login_portal(domain)
    end
    element id: ID::ACCOUNTS
  end

  def self.logn_personal(domain)
    click text: ConstIndex::PERSONAL_TAB, pause: 2
    email = login_data_personal[domain]['email']
    pass =  login_data_personal[domain]['p']
    fill_form id: ID::PERSONAL_EMAIL, data: email
    fill_form id: ID::PERSONAL_PASSWORD, data: pass
    click id: ID::PERSONAL_SIGN_IN
  end

  def self.login_portal(domain)
    portal_name = login_data_portals[domain]['portal']
    login = login_data_portals[domain]['email']
    pass = login_data_portals[domain]['p']
    fill_form id: ID::ENTERPRISE_PORTAL, data: portal_name
    click id: ID::ENTERPRISE_NEXT
    fill_form id: ID::ENTERPRISE_EMAIL, data: login
    fill_form id: ID::ENTERPRISE_PASSWORD, data: pass
    click id: ID::ENTERPRISE_SIGN_IN
  end

  def self.before_login
    click id: ID::SKIP_ONBOARDING
    click id: ID::CLOUDS
  end

  def self.login_facebook(email_fb, p_fb)
    click id: ID::FACEBOOK
    fill_form textfield: ConstIndex::FACEBOOK_LOGIN, data: email_fb, pause: 5
    fill_form textfield: ConstIndex::FACEBOOK_PASS, data: p_fb
    click button: ConstIndex::FACEBOOK_NEXT
    click button: ConstIndex::FACEBOOK_CONTINUE, pause: 5
    element id: ID::ACCOUNTS, pause: 5
  end

  def self.login_google
    click id: ID::GOOGLE
    click text: ConstIndex::GOOGLE_USER, pause: 3
    element id: ID::ACCOUNTS
  end

  def self.login_cloud(portal, login, pass)
    fill_form id: ID::CLOUD_NAME,  data: portal
    fill_form id: ID::CLOUD_LOGIN, data: login
    fill_form id: ID::CLOUD_PASS,  data: pass
    click     id: ID::CLOUD_SAVE
  end
end
