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

   # Добавляем xcconfig параметры
   spec.xcconfig = {
     'CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER' => 'NO',
     'CONFIGURATION_BUILD_DIR' => '${PODS_CONFIGURATION_BUILD_DIR}/mailcore2-ios',
     'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) COCOAPODS=1',
     'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/Headers/Public" "${PODS_ROOT}/Headers/Public/mailcore2-ios"',
     'LIBRARY_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/mailcore2-ios/lib"',
     'OTHER_LDFLAGS' => '$(inherited) -l"MailCore-ios" -l"c++" -l"iconv" -l"resolv" -l"xml2" -l"z"',
     'PODS_BUILD_DIR' => '${BUILD_DIR}',
     'PODS_CONFIGURATION_BUILD_DIR' => '${PODS_BUILD_DIR}/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)',
     'PODS_DEVELOPMENT_LANGUAGE' => '${DEVELOPMENT_LANGUAGE}',
     'PODS_ROOT' => '${SRCROOT}',
     'PODS_TARGET_SRCROOT' => '${PODS_ROOT}/mailcore2-ios',
     'PODS_XCFRAMEWORKS_BUILD_DIR' => '$(PODS_CONFIGURATION_BUILD_DIR)/XCFrameworkIntermediates',
     'PRODUCT_BUNDLE_IDENTIFIER' => 'org.cocoapods.${PRODUCT_NAME:rfc1034identifier}',
     'SKIP_INSTALL' => 'YES',
     'USE_RECURSIVE_SCRIPT_INPUTS_IN_SCRIPT_PHASES' => 'YES'
   }

spec.prepare_command = <<-CMD
    # Печать текущей директории перед перемещением файлов
    echo "Текущая директория: $(pwd)"
    
    # Используем переменную PODS_ROOT для целевой директории
    TARGET_DIR="${PODS_ROOT}/mailcore2-ios"

    # Печать целевой директории
    echo "Целевая директория: $TARGET_DIR"

    # Проверяем, что директория с распакованными файлами существует
    if [ ! -d "$(pwd)/mailcore2-ios" ]; then
      echo "Директория mailcore2-ios не найдена! Пожалуйста, распакуйте архив перед выполнением скрипта."
      exit 1
    fi

    # Проверяем, что целевая директория существует
    if [ ! -d "$TARGET_DIR" ]; then
      echo "Целевая директория $TARGET_DIR не найдена!"
      exit 1
    fi

    # Перемещаем файлы из $(pwd)/mailcore2-ios в директорию проекта (PODS_ROOT)
    mv $(pwd)/mailcore2-ios/*/* $TARGET_DIR

    # Печать текущей директории после перемещения файлов
    echo "Текущая директория после перемещения файлов: $(pwd)"
    echo "Файлы успешно перемещены в $TARGET_DIR"
  CMD
end
