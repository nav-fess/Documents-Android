# frozen_string_literal: true

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
        'Languages and locali zation are not supported'
      end
    end

    def self.change_domain_to_info
      input_text_id('login_create_portal_address_edit', 'getinfoportal00000')
      clear_id('login_create_portal_address_edit')
    end
  end

  class Login
    def self.login_facebook(email_fb_, p_fb )
      click_id 'login_social_facebook_button'
      input_text_xpath("*//android.view.View[@index='2']/android.widget.EditText[@index='0']", email_fb_)
      input_text_xpath("*//android.view.View[@index='2']/android.widget.EditText[@index='1']", p_fb)
      click_xpath("*//android.widget.Button[@index='2']")
      click_xpath("*//android.widget.Button[@index='0']")
      click_id 'accountContainer'
    end

    def self.login_google
      click_id 'login_social_google_button'
      click_xpath("*//android.support.v7.widget.RecyclerView[@index='3']/android.widget.LinearLayout[@index='0']")
      click_id 'accountContainer'
    end

    def self.before_login
      capabilities_set('locale' => 'EN', 'language' => 'EN')
      click_id 'on_boarding_panel_skip_button'
      click_id 'menu_item_cloud'
      click_id 'cloudsItemOnlyOffice'
    end
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
