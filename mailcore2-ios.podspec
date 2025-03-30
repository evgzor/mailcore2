Pod::Spec.new do |spec|
  spec.name          = 'mailcore2-ios'
  spec.version       = '0.6.4'
  spec.summary       = 'MailCore 2 for iOS'
  spec.description   = 'MailCore 2 provides a simple and asynchronous API to work with e-mail protocols IMAP, POP, and SMTP.'
  spec.homepage      = 'http://libmailcore.com'
  spec.license       = { :type => 'BSD', :file => 'LICENSE' }
  spec.authors       = 'MailCore Authors'

  spec.source        = { :http => 'https://storage.googleapis.com/fileserver.gxservers.com/mattmaddux/mailcore2/0.6.4.zip', :flatten => true }

  spec.platform     = :ios, '12.0'

  spec.requires_arc = false

  spec.header_dir = 'MailCore'
  spec.public_header_files = 'mailcore2-ios/include/MailCore/*.h'
  spec.preserve_paths = 'mailcore2-ios/include/MailCore/*.h'
  spec.source_files = "mailcore2-ios/include/MailCore/*.h"
  spec.vendored_libraries = 'mailcore2-ios/lib/libMailCore-ios.a'
  spec.libraries = ['xml2', 'iconv', 'z', 'c++', 'resolv']

end
