# frozen_string_literal: true

# PageObject for Settings
class Settings < BasePageObject
  button 'switch', id: 'wifiSwitch'
  layout 'clear_cache', id: 'clearCacheLayout'
  button 'about', id: 'settingAboutItem'
  button 'help', id: 'settingHelpItem'
  button 'feedback', id: 'settingSupportItem'
end
