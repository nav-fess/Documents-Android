# frozen_string_literal: true

# PageObject for FileList
class FileList < BasePageObject
  layout 'main', id: 'list_of_items'

  layout 'file', id: 'list_explorer_file_layout'
  text 'file_name', id: 'list_explorer_file_name'
  text 'file_info', id: 'list_explorer_file_info'
  button 'file_context', id: 'list_explorer_file_context'

  layout 'folder', id: 'list_explorer_file_layout'
  text 'folder_name', id: 'list_explorer_file_name'
  text 'folder_info', id: 'list_explorer_file_info'
  button 'folder_context', id: 'list_explorer_file_context'

  button 'plus_fab', id: 'app_floating_action_button'
end
