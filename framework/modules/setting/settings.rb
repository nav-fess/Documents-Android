# frozen_string_literal: true

# PageObject for Settings
class Settings < BasePageObject
  CLEAR_SIZE_CACHE = '0.00 Bytes'
  PATH_TO_FILE = 'sdcard/OnlyOffice/'
  NAME_FILE = 'big_size.pptx'
  HELP_URL = 'https://helpcenter.onlyoffice.com/mobile-applications/documents/android/'
  CHOOSE_EMAIL = 'Choose email client...'

  button 'switch', id: 'wifiSwitch'
  layout 'clear_cache', id: 'clearCacheLayout'
  text 'size_cache', id: 'cacheSizeTextView'
  button 'about', id: 'settingAboutItem'
  button 'help', id: 'settingHelpItem'
  button 'feedback', id: 'settingSupportItem'

  text 'help_url', xpath: '//android.widget.EditText'
  textfield 'edit_feedback', id: 'dialogCommonEditMultilineValueEdit'
  text 'tab_emails', xpath: '//android.widget.TextView'
end
