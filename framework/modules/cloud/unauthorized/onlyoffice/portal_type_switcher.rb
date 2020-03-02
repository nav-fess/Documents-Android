# frozen_string_literal: true

# PageObject for Portal Type Switcher
class PortalTypeSwitcher < BasePageObject
  button 'enterprise', xpath: "//androidx.appcompat.app.ActionBar.Tab[@index='0']"
  button 'personal', xpath: "//androidx.appcompat.app.ActionBar.Tab[@index='1']"
end
