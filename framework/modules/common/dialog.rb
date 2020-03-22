# frozen_string_literal: true

# PageObject for Dialog
class Dialog < BasePageObject
  layout 'main', id: 'dialogContainer'
  text 'title', id: 'dialogCommonTopTitleText'
  text 'info', id: 'dialogCommonBottomTitleText'
  button 'cancel', id: 'dialogCommonCancelButton'
  button 'accept', id: 'dialogCommonAcceptButton'
  textfield 'name', id: 'dialogCommonEditLineValueEdit'
  text 'hint', id: 'dialogCommonEditLineHintEdit'

  def self.create(name)
    name_textfield_fill name
    accept_button_click
  end
end
