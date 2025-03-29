Pod::Spec.new do |spec|
  spec.name          = 'mailcore2-ios'
  spec.version       = '0.6.4'
  spec.summary       = 'MailCore 2 for iOS'
  spec.description   = 'MailCore 2 provides a simple and asynchronous API to work with e-mail protocols IMAP, POP, and SMTP.'
  spec.homepage      = 'http://libmailcore.com'
  spec.license       = { :type => 'BSD', :file => 'LICENSE' }
  spec.authors       = 'MailCore Authors'

  spec.source        = { :http => 'https://storage.googleapis.com/fileserver.gxservers.com/mattmaddux/mailcore2/0.6.4.zip', :flatten => true }

  spec.platform     = :ios, '8.0'

  spec.requires_arc = false

  spec.public_header_files = 'include/MailCore/*.h'
  spec.preserve_paths = 'include/MailCore/*.h'

  spec.vendored_libraries = 'lib/libMailCore-ios.a'

  spec.libraries = ['xml2', 'iconv', 'z', 'c++', 'resolv']

  spec.prepare_command = <<-CMD
    echo "Текущая директория перед скачиванием: $(pwd)"
    mv mailcore2-extracted/*/* .
    rm -rf mailcore2-extracted
  CMD
end
