# frozen_string_literal: true

# PageObject for CloudFileList
class CloudFileList < FileList
  layout 'folder', id: 'list_explorer_folder_layout'
  text 'folder_name', id: 'list_explorer_folder_name'
  text 'folder_info', id: 'list_explorer_folder_info'
  button 'folder_context', id: 'list_explorer_folder_context'
end
