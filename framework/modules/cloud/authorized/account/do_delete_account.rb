# frozen_string_literal: true

# DeletetAccount for CloudFileList
class DeleteAccount < BasePageObject
  button 'cancel', id: 'dialogCommonCancelButton'
  button 'delete', id: 'dialogCommonAcceptButton'
end
