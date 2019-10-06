# frozen_string_literal: true
require 'json'

module Helpers
  # Class contains data help methods for Registration portal
  class DataPortals
    def self.data_portals
      JSON.parse(File.read("#{Dir.pwd}/PortalTypeData.json"))
    end

    def self.data_registration_portal(tl_domen)
      all_data_potal = data_portals[tl_domen]
                       .to_s.split('|').concat locale_language(tl_domen)
      keys_hash_data_portals.zip(all_data_potal).to_h
    end

    def self.search_data_registration_portal(domen_name, attribute)
      data = data_registration_portal(domen_name)
      data[attribute]
    end

    def self.locale_language(tl_domen)
      case tl_domen
      when 'eu', 'info'
        %w[RU RU]
      when 'com'
        %w[EN EN]
      when 'sg'
        %w[VIE VI]
      else
        'Languages and localization are not supported'
      end
    end

    def self.keys_hash_data_portals
      %w[portal email first_name last_name p locale language]
    end

    def self.click_element_screen(key_id, value_element)
      wait_true { find_element(key_id => value_element) }.click
    end

    def self.field_input_text(key_id, value_element, text)
      wait_true { find_element(key_id => value_element) }.send_keys(text)
    end
  end
end


