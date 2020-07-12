# frozen_string_literal: true

# PageObject for Settings
class Settings < BasePageObject
  CLEAR_SIZE_CACHE = '0.00 Bytes'
  PATH_TO_FILE = 'sdcard/OnlyOffice/'
  NAME_FILE = 'big_size.pptx'

  button 'switch', id: 'wifiSwitch'
  layout 'clear_cache', id: 'clearCacheLayout'
  text 'size_cache', id: 'cacheSizeTextView'
  button 'about', id: 'settingAboutItem'
  button 'help', id: 'settingHelpItem'
  button 'feedback', id: 'settingSupportItem'
end
