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

  def self.create_file(name, type)
    CommonFileList.plus_fab_button_click
    method("#{type}_button_click").call
    Dialog.create name
  end

  def self.create_folder(name)
    CommonFileList.plus_fab_button_click
    folder_button_click
    Dialog.create name
  end
end
