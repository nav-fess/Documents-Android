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
end
