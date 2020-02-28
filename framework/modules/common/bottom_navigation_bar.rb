# frozen_string_literal: true

# PageObject for BottomNavigationBar
class BottomNavigationBar < BasePageObject
  button 'recent', id: 'menu_item_recent'
  button 'clouds', id: 'menu_item_cloud'
  button 'on_device', id: 'menu_item_on_device'
  button 'profile', id: 'menu_item_setting'
end
