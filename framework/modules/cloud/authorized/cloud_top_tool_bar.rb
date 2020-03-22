# frozen_string_literal: true

# PageObject for CloudTopToolBar
class CloudTopToolBar < BasePageObject
  layout 'account', id: 'accountContainer'
  text 'account_title', id: 'toolbarTitle'
  text 'account_sub_title', id: 'toolbarSubTitle'
  layout 'sections', id: 'app_bar_tabs'
end
