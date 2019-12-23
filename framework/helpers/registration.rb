# frozen_string_literal: true

require_relative '../../spec/spec_helper.rb'

# Class contains data help methods for Registration portal
class Registration
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
    fill_form id: ID::REGISTRATION_NAME, data: 'getinfoportal00000'
    element(id: ID::REGISTRATION_NAME).clear
  end

  def self.tap_on_skip
    click id: ID::SKIP_ONBOARDING
  end

  def self.tap_on_clouds
    click id: ID::CLOUDS
  end

  def self.tap_on_onlyoffice
    click id: ID::CLOUDS_MENU_ITEM
  end

  def self.tap_on_registration_button
    click id: ID::REGISTRATION_CREATE
  end

  def self.fill_portal_name(portal_name)
    fill_form id: ID::REGISTRATION_NAME, data: portal_name
  end

  def self.top_level_domain
    element(id: ID::REGISTRATION_DOMAIN).text.split('.').last
  end

  def self.fill_email(email)
    fill_form id: ID::REGISTRATION_EMAIL, data: email
  end

  def self.fill_first_name(first_name)
    fill_form id: ID::REGISTRATION_FN, data: first_name
  end

  def self.fill_last_name(last_name)
    fill_form id: ID::REGISTRATION_LN, data: last_name
  end

  def self.sig_in
    click id: ID::REGISTRATION_SIGN
  end

  def self.fill_pass(pass)
    fill_form id: ID::REGISTRATION_PASS, data: pass
  end

  def self.re_fill_pass(pass)
    fill_form id: ID::REGISTRATION_R_PASS, data: pass
  end
end
