# frozen_string_literal: true
require_relative '../../Framework/constants/id.rb'
require_relative '../../Framework/constants/const_iterator.rb'
require_relative '../../Framework/Tools/appium_extension.rb'


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
      click_id 'cloudsItemOnlyOffice'
      if domain.eql? 'personal'
        click_xpath("*//android.widget.TextView[@text='PERSONAL']")
      else
        portal_name = login_data_portals[domain]['portal']
        input_text_id('login_enterprise_portal_edit', portal_name)
        click_id 'login_enterprise_next_button'
      end
      login_google
      find_id 'accountContainer'
    end

    def self.before_login
      capabilities_set('locale' => 'EN', 'language' => 'EN')
      click id: ID::SKIP_ONBOARDING
      click id: ID::CLOUDS
    end

    def self.login_facebook(email_fb, p_fb)
      click id: ID::FACEBOOK
      fill_form textfield: ConstIndex::GOOGLE_LOGIN, data: email_fb, pause: 10
      fill_form textfield: ConstIndex::GOOGLE_PASS, data: p_fb
      click button: ConstIndex::GOOGLE_NEXT
      sleep 4
      click button: ConstIndex::GOOGLE_CONTINUE
      sleep 8
      element id: ID::ACCOUNTS
    end

    def self.login_google
      click id: ID::GOOGLE
      #sleep 3
      click text: ConstIter::GOOGLE_USER
      element id: ID::ACCOUNTS
    end

    def self.login_cloud(portal, login, pass)
      input_text_id('storage_web_dav_url_edit', portal)
      input_text_id('storage_web_dav_login_edit', login)
      input_text_id('storage_web_dav_password_edit', pass)
      click_id 'storage_web_dav_save_button'
      find_id 'accountContainer'
    end
  end

  def find_id(id)
    wait_true { find_element(id: id) }
  end

  def click_id(id)
    wait_true { find_element(id: id) }.click
  end

  def click_xpath(xpath)
    wait_true { find_element(xpath: xpath) }.click
  end

  def get_text_id(id)
    wait_true { find_element(id: id) }.text
  end

  def input_text_xpath(xpath, text)
    wait_true { find_element(xpath: xpath) }.send_keys(text)
  end

  def input_text_id(id, text)
    wait_true { find_element(id: id) }.send_keys(text)
  end

  def clear_id(id)
    wait_true { find_element(id: id) }.clear
  end

  def capabilities_set(capabilities)
    capabilities.each do |key, value|
      caps[key] = value
    end
    restart
  end
end