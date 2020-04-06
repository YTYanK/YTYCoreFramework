Pod::Spec.new do |spec|

  spec.name         = "YTYCoreFramework"
  spec.version      = "0.0.8"
  spec.summary      = "删除多余属性，修改YTYTools"
  spec.description  = <<-DESC
  发布构建框架
  1.构建的框架分成两个部分Core、Catorgory
  2.核心文件除勒YTYTools、YTYRequest,其余文件直接继承重写方法
  3.Catorgory 是扩展的辅助功能
  DESC
  
  spec.homepage     = "https://github.com/YTYanK/YTYCoreFramework.git"
  spec.license      = {:type => "Apache License, Version 2.0", :file => "LICENSE"}
  spec.author       = {"YTYanK" => "872825564@qq.com"}
  spec.source       = { :git => "https://github.com/YTYanK/YTYCoreFramework.git", :tag => "v#{spec.version}", :submodules => true} 
 
#   spec.source_files = "YTYCoreFramework","YTYCoreFramework/*.{h,m}","YTYCoreFramework/Core/*.{h,m}","YTYCoreFramework/Catorgory/*.{h,m}"
#   spec.public_header_files = "YTYCoreFramework/Core/*.h","YTYCoreFramework/Catorgory/*.h"
     spec.source_files = "YTYCoreFramework/YTYConfigure.h","YTYCoreFramework/YTYCoreFramework.h"
   # "YTYCoreFramework/Core/*.{h,m}" 
   # "YTYCoreFramework/Catorgory/*.{h,m}"
     
  spec.subspec 'Catorgory' do |ss|
    ss.source_files = "YTYCoreFramework/*.{h}","YTYCoreFramework/YTYConfigure.h","YTYCoreFramework/Catorgory/*.{h,m}"
    ss.frameworks = 'Foundation','UIKit'
  end 
  

 spec.subspec 'Core' do |ss|  
     ss.source_files = "YTYCoreFramework/*.{h}","YTYCoreFramework/YTYConfigure.h","YTYCoreFramework/Core/{*.h,*.m}"  
     ss.frameworks = 'Foundation','UIKit' 
     ss.dependency 'YTYCoreFramework/Catorgory'
 end

  #-- 过滤全部.m文件 --#
  # spec.exclude_files = "YTYCoreFramework/**/unused.{m}"
  # spec.public_header_files = 'YTYCoreFramework/*.{h}'
  
  spec.frameworks = 'Foundation','UIKit'
  
  #spec.prefix_header_contents  =  '#import <UIKit/UIKit.h>' , '#import <Foundation/Foundation.h>'
  #-- 配置 --#
  spec.platform = :ios
  spec.ios.deployment_target = '9.0'  
  spec.requires_arc = true 
  spec.xcconfig = {"FRAMEWORK_SESARCH_PATHS" => "$(PLATFORM_DIR)/Developer/Library/Frameworks"}

  #-- 资源 --#
  spec.resource = "YTYCoreFramework/Catorgory/MBProgressHUD.bundle"
  #spec.resource = "YTYCoreFramework/*.png'
  #-- 依赖 --#
  spec.dependency "AFNetworking", "~>3.2.1"
  spec.dependency "YYModel", "~>1.0.4"
  spec.dependency "YYCache", "~>1.0.4"
  spec.dependency "MJRefresh", "~>3.1.12"
  spec.dependency "MBProgressHUD", "~>1.2.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  #spec.source       = { :git => "http://EXAMPLE/YTYCoreFramework.git", :tag => "#{spec.version}" }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

 end
