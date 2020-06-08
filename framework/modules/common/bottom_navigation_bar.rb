# frozen_string_literal: true

# PageObject for BottomNavigationBar
class BottomNavigationBar < BasePageObject
  layout 'main', id: 'bottom_navigation'

  button 'recent', id: 'menu_item_recent'
  button 'clouds', id: 'menu_item_cloud', delay: 4
  button 'on_device', id: 'menu_item_on_device'
  button 'profile', id: 'menu_item_setting'

  def self.active_section
    find_nested_element parent: main_layout, xpath: '//android.widget.TextView[@selected="true"]'
  end
end
