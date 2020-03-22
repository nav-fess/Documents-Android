# frozen_string_literal: true

# PageObject for TopToolBar
class TopToolBar < BasePageObject
  layout 'main', id: 'app_bar_toolbar'

  button 'search', id: 'toolbar_item_search'
  textfield 'search', id: 'search_src_text'
  button 'search_close', id: 'search_close_btn'

  button 'sort', id: 'toolbar_item_sort'
end
