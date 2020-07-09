# frozen_string_literal: true

# PageObject for Alert
class Alert < BasePageObject
  DONT_UPLOAD = 'You can upload only when Wi-Fi is enabled'

  text 'snackbar', id: 'snackbar_text'
end
