# frozen_string_literal: true

# PageObject for Plus Float Action Button
class PlusFAB < BasePageObject
  button 'document', id: 'list_explorer_action_docs'
  button 'spreadsheet', id: 'list_explorer_action_sheet'
  button 'presentation', id: 'list_explorer_action_presentation'
  button 'folder', id: 'list_explorer_action_folder'
  button 'take_photo', id: 'list_explorer_action_photo'
  button 'upload', id: 'list_explorer_action_upload'
  button 'add_storage', id: 'list_explorer_action_storage'
end
