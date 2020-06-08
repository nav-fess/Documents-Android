# frozen_string_literal: true

# PageObject for Search
class Search < BasePageObject
  TIME_TO_SEARCH = 2

  textfield 'query', id: 'search_src_text'
  button 'close', id: 'search_close_btn'

  def self.perform(search_query)
    TopToolBar.search_button_click if TopToolBar.search_button_wait
    query_textfield_fill search_query
    sleep TIME_TO_SEARCH
  end
end
