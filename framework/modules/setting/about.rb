# frozen_string_literal: true

# PageObject for About
class About < BasePageObject
  TERMS_OF_USE = 'https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5048471&doc=bXJ6UmJacDVnVDMxV01oMHhrUlpwaGFBcXJUUUE3VHRuTGZrRUF5a1NKVT0_IjUwNDg0NzEi0'
  PRIVACY_POLICY = 'https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5048502&doc=SXhWMEVzSEYxNlVVaXJJeUVtS0kyYk14YWdXTEFUQmRWL250NllHNUFGbz0_IjUwNDg1MDIi0&_ga=2.88767003.1895363220.1524051386-398072085.1517577558'
  LICENSE = 'http://www.apache.org/licenses/LICENSE-2.0'
  WEBSITE = 'https://www.onlyoffice.com/'

  button 'terms', id: 'about_terms'
  button 'policy', id: 'about_policy'
  button 'license', id: 'about_license'
  button 'website', id: 'about_website'

  text 'terms_url', xpath: '//android.widget.EditText'
  text 'privacy_policy_url', xpath: '//android.widget.EditText'
  text 'apache_license_url', xpath: "//android.view.View[@index='2']"
  text 'website_url', xpath: '//android.widget.EditText'
end
