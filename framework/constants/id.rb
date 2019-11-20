# frozen_string_literal: true

# Module for storing resource-id values

module ID
  # Profile
  ACCOUNTS = 'accountContainer'

  # Onboarding
  SKIP_ONBOARDING = 'on_boarding_panel_skip_button'

  # Clouds list
  CLOUDS_MENU_ITEM = 'cloudsItemOnlyOffice'

  # Enterprise login
  ENTERPRISE_PORTAL = 'login_enterprise_portal_edit'
  ENTERPRISE_NEXT = 'login_enterprise_next_button'
  ENTERPRISE_EMAIL = 'login_enterprise_portal_email_edit'
  ENTERPRISE_PASSWORD = 'login_enterprise_portal_password_edit'
  ENTERPRISE_SIGN_IN = 'login_enterprise_signin_button'

  # Enterprise registration
  REGISTRATION_CREATE = 'login_enterprise_create_button'
  REGISTRATION_NAME = 'login_create_portal_address_edit'
  REGISTRATION_DOMAIN = 'login_create_portal_address_hint_end'
  REGISTRATION_EMAIL = 'login_create_portal_email_edit'
  REGISTRATION_FN = 'login_create_portal_first_name_edit'
  REGISTRATION_LN = 'login_create_portal_last_name_edit'
  REGISTRATION_SIGN = 'login_signin_create_portal_button'
  REGISTRATION_PASS = 'login_signin_password_edit'
  REGISTRATION_R_PASS = 'login_signin_repeat_edit'

  # Personal login
  PERSONAL_EMAIL = 'login_personal_portal_email_edit'
  PERSONAL_PASSWORD = 'login_personal_portal_password_edit'
  PERSONAL_SIGN_IN = 'login_personal_signin_button'

  # social networks
  GOOGLE = 'login_social_google_button'
  FACEBOOK = 'login_social_facebook_button'

  # Clouds
  TOOLBAR_PORTAL_URL = 'toolbarSubTitle'
  NEXTCLOUD = 'cloudsItemNextCloud'
  OWNCLOUD = 'cloudsItemOwnCloud'
  WEBDAV = 'cloudsItemWebDav'
  CLOUD_NAME = 'storage_web_dav_url_edit'
  CLOUD_LOGIN = 'storage_web_dav_login_edit'
  CLOUD_PASS = 'storage_web_dav_password_edit'
  CLOUD_SAVE = 'storage_web_dav_save_button'

  # Common
  PLUS_FAB = 'app_floating_action_button'
  FILE_LIST = 'list_of_items'
  FILE_LAYOUT = 'list_explorer_file_layout'
  FILE_NAME = 'list_explorer_file_name'
  FILE_INFO = 'list_explorer_file_info'
  FILE_CONTEXT = 'list_explorer_file_context'
  SNACKBAR = 'snackbar_text'
  FOLDER_NAME = 'list_explorer_folder_name'
  FOLDER_INFO = 'list_explorer_folder_info'
  FOLDER_CONTEXT = 'list_explorer_folder_context'
  SEARCH = 'search_button'
  SEARCH_FORM = 'search_src_text'

  # File context menu
  FILE_CONTEXT_NAME = 'list_explorer_context_header_title_text'
  FILE_CONTEXT_INFO = 'list_explorer_context_header_info_text'
  FILE_COPY = 'list_explorer_context_copy'
  FILE_DOWNLOAD = 'list_explorer_context_download'
  FILE_SHARE_REMOVE = 'list_explorer_context_share_delete'

  # Manager sections
  RECENT = 'menu_item_recent'
  CLOUDS = 'menu_item_cloud'
  ON_DEVICE = 'menu_item_on_device'
  PROFILE = 'menu_item_setting'

  # Onlyoffice FAB menu
  CREATE_DO = 'list_explorer_action_docs'
  CREATE_TABLE = 'list_explorer_action_sheet'
  CREATE_PRESENTATION = 'list_explorer_action_presentation'
  CREATE_FOLDER = 'list_explorer_action_folder'
  MAKE_PHOTO = 'list_explorer_action_photo'
  UPLOAD_FILE = 'list_explorer_action_upload'
  CONNECT_STORAGE = 'list_explorer_action_storage'
  EDIT_NAME_FIELD = 'dialogCommonEditLineValueEdit'
  CREATE_FAB = 'dialogCommonAcceptButton'

  # Storage
  CONNECT_SAVE = 'storage_connect_save'
end
