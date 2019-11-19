# frozen_string_literal: true

require_relative '../../Framework/constants/id.rb'
require_relative '../../Framework/constants/const_index.rb'
require_relative '../../Framework/Tools/appium_extension.rb'
include AppiumExtension

# Module contain different classes of help
module Helpers
  # Class contains data help methods for Registration portal
  class DataPortals
    def self.locale_language(tl_domain)
      case tl_domain
        when 'eu', 'info'
          { 'locale' => 'RU', 'language' => 'RU' }
        when 'com'
          { 'locale' => 'EN', 'language' => 'EN' }
        when 'sg'
          { 'locale' => 'VN', 'language' => 'vi' }
        else
          'Languages and localization are not supported'
      end
    end

    def self.change_domain_to_info
      input_text_id('login_create_portal_address_edit', 'getinfoportal00000')
      clear_id('login_create_portal_address_edit')
    end
  end

  # Class contains data help methods for login on a portal
  class Login
    def self.login_complete(domain)
      before_login
      click id: ID::CLOUDS_MENU_ITEM #'cloudsItemOnlyOffice'
      if domain.eql? 'personal'
        click_on_tab = click text: ConstIndex::PERSONAL_TAB, pause: 2
      else
        portal_name = login_data_portals[domain]['portal']
        fill_form id: ID::ENTERPRISE_PORTAL, data: portal_name
        click id: ID::ENTERPRISE_NEXT
      end
      login_google
      element id: ID::ACCOUNTS
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
      element id: ID::ACCOUNTS
    end
  end

  def capabilities_set(capabilities)
    capabilities.each do |key, value|
      caps[key] = value
    end
    restart
  end
end

