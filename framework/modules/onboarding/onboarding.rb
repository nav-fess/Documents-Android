# frozen_string_literal: true

# PageObject for Onboarding
class Onboarding < BasePageObject
  button 'next', id: 'on_boarding_panel_next_button'
  button 'skip', id: 'on_boarding_panel_skip_button'

  text 'title', id: 'on_boarding_page_header'
  text 'description', id: 'on_boarding_page_info'

  image 'example', id: 'on_boarding_page_image'
  view 'indicator', id: 'on_boarding_panel_indicator'
end
