# frozen_string_literal: true

# PageObject for ContextMenu
class ContextMenu < BasePageObject
  text 'name', id: 'list_explorer_context_header_title_text'
  text 'info', id: 'list_explorer_context_header_info_text'
  button 'share', id: 'list_explorer_context_share'
  button 'move', id: 'list_explorer_context_move'
  button 'copy', id: 'list_explorer_context_copy'
  button 'rename', id: 'list_explorer_context_rename'
  button 'remove', id: 'list_explorer_context_delete'
  button 'edit', id: 'list_explorer_context_edit'
  button 'external_share', id: 'list_explorer_context_external_link'
  button 'download', id: 'list_explorer_context_download'
end
