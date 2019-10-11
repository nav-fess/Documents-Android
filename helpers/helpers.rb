# frozen_string_literal: true
module Helpers
  # Class contains data help methods for Registration portal
  class DataPortals
    def self.locale_language(tl_domen)
      case tl_domen
      when 'eu', 'info'
        {locale: "RU", language:"RU"}
      when 'com'
        {locale: "EN", language:"EN"}
      when 'sg'
        {locale: "VN", language:"vi"}
      else
        'Languages and localization are not supported'
      end
    end

  end

  def click_id(id)
    wait_true { find_element(id: id) }.click
  end

  def get_text_id(id)
    wait_true { find_element(id: id) }.text
  end

  def input_text_id(id, text)
    wait_true { find_element(id: id ) }.send_keys(text)
  end

end


