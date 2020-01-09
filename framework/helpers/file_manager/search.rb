# frozen_string_literal: true

module FileManager
  # Class for search files and folders in section
  class Search
    MAX_SWIPES_COUNT = 100

    def self.open
      click id: ID::SEARCH
    end

    def self.fill_form(data)
      fill_form id: ID::SEARCH_FORM, data: data
    end

    def self.close
      close_keyboard
      2.times { hardback }
    end

    def self.find_file_on_page(string)
      page = element id: ID::FILE_LIST
      items = elements id: ID::FILE_LAYOUT
      counter = 0
      loop do
        break_trigger = find_break_trigger items

        target = find_on_visible_page items, ID::FILE_NAME, string
        return target unless target.nil?

        swipe_down page, 0.2, 0.8, 5000
        counter += 1
        items = elements id: ID::FILE_LAYOUT
        break if break_trigger == find_break_trigger(items) || counter > MAX_SWIPES_COUNT
      end
    end

    def self.find_break_trigger(items)
      find_inside(element: items[items.length / 2], id: ID::FILE_NAME).text
    end

    def self.find_on_visible_page(items, target_id, target_string)
      items.each do |item|
        item_text = find_inside_safe element: item, id: target_id
        return item if !item_text.nil? && item_text.text == target_string
      end
      nil
    end

    def self.find_folder_on_page(string)
      items = elements id: ID::FOLDER_LAYOUT
      find_on_visible_page items, ID::FOLDER_NAME, string
    end

    def self.folder_exist?(string)
      !find_folder_on_page(string).nil?
    end
  end
end
