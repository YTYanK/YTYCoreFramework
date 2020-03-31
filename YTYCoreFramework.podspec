Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "YTYCoreFramework"
  spec.version      = "0.0.1"
  spec.summary      = "YTYCoreFramework 基础构建框架"
  spec.description  = <<-DESC
  发布构建框架
  1.构建的框架分成两个部分Core、Catorgory
  2.核心文件除勒YTYTools、YTYRequest,其余文件直接继承重写方法
  3.Catorgory 是扩展的辅助功能
  DESC
  
  spec.homepage     = "https://github.com/YTYanK/YTYCoreFramework.git"
  spec.license      = {:type => "Apache License, Version 2.0", :file => "LICENSE"}
  #spec.license = 'Apache License, Version 2.0'
  spec.author       = {"YTYanK" => "872825564@qq.com"}
  spec.source       = { :git => "https://github.com/YTYanK/YTYCoreFramework.git", :tag => "v#{spec.version}", :submodules => true} 
 
  spec.source_files = "YTYCoreFramework","YTYCoreFramework/*.{h}","YTYCoreFramework/Core/*.{h,m}","YTYCoreFramework/Catorgory/*.{h,m}"
  
  spec.frameworks = 'Foundation','UIKit'
  
  #spec.prefix_header_contents  =  '#import <UIKit/UIKit.h>' , '#import <Foundation/Foundation.h>'
  spec.platform = :ios
  spec.ios.deployment_target = '9.0'  
  spec.requires_arc = true 
  spec.xcconfig = {"FRAMEWORK_SESARCH_PATHS" => "$(PLATFORM_DIR)/Developer/Library/Frameworks"}

  spec.resource = "YTYCoreFramework/CAtorgory/MBProgressHUD.bundle"
  
  spec.dependency "AFNetworking"
  spec.dependency "YYModel", "~>1.0.4"
  spec.dependency "YYCache", "~>1.0.4"
  spec.dependency "MJRefresh", "~>3.1.12"
  spec.dependency "MBProgressHUD", "~>1.2.0"


  # spec.license      = "MIT (example)"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  # spec.author             = { "POP3mac" => "" }
  # Or just: spec.author    = "POP3mac"
  # spec.authors            = { "POP3mac" => "" }
  # spec.social_media_url   = "https://twitter.com/POP3mac"
  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  #spec.source       = { :git => "http://EXAMPLE/YTYCoreFramework.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"


end