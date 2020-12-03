Pod::Spec.new do |spec|

  spec.name         = "YTYCoreFramework"
  spec.version      = "0.1.5"
  spec.summary      = "重构Core、Catorgory内容，并且完善方法"
  spec.description  = <<-DESC
  构建框架
  1.构建的框架分成两个部分Core、Catorgory
  2.核心除了YTYTools（工具）、YTYRequest（工具）,其余文件直接继承重写方法
  3.Catorgory 是扩展的辅助功能
  4.YTYConfigure.h 文件是宏定义文件，核心通用方法都在里面 
  DESC
  
  spec.homepage     = "https://github.com/YTYanK/YTYCoreFramework.git"
  spec.license      = {:type => "Apache License, Version 2.0", :file => "LICENSE"}
  spec.author       = {"YTYanK" => "872825564@qq.com"}
  spec.source       = { :git => "https://github.com/YTYanK/YTYCoreFramework.git", :tag => "v#{spec.version}", :submodules => true} 
 
#   spec.source_files = "YTYCoreFramework","YTYCoreFramework/*.{h,m}","YTYCoreFramework/Core/*.{h,m}","YTYCoreFramework/Catorgory/*.{h,m}"
#   spec.public_header_files = "YTYCoreFramework/Core/*.h","YTYCoreFramework/Catorgory/*.h"
    spec.source_files = "YTYCoreFramework/YTYConfigure.h","YTYCoreFramework/YTYCoreFramework.h"
    #,"YTYCoreFramework/Core/YTYCore.h","YTYCoreFramework/Core/UIKit+YTYCatorgory.h"
     
  spec.subspec 'Catorgory' do |ss|
    ss.source_files = "YTYCoreFramework/Catorgory/*.{h,m}"
    ss.public_header_files = "YTYCoreFramework/Catorgory/*.h"
    ss.frameworks = 'Foundation','UIKit'
    ss.dependency "MBProgressHUD", "~>1.2.0"
    ss.resource = "YTYCoreFramework/Catorgory/MBProgressHUD.bundle"
  end 
  

 spec.subspec 'Core' do |ss|  
     ss.source_files = "YTYCoreFramework/*.h","YTYCoreFramework/Core/{*.h,*.m}"  
#     ss.public_header_files = "YTYCoreFramework/*.h","YTYCoreFramework/Core/*.h"
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
  #spec.ios.pod_target_xcconfig = {OTHER_LDFLAGS => "-ObjC"}
  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

  #-- 资源 --#
  #spec.resources = "YTYCoreFramework/Catorgory/*.bundle"
  #spec.resources = "YTYCoreFramework/Catorgory/*.png"
  #-- 依赖 --#
  spec.dependency "AFNetworking", "~>4.0.1"
  spec.dependency "YYModel", "~>1.0.4"
  spec.dependency "YYCache", "~>1.0.4"
  spec.dependency "MJRefresh", "~>3.5.0"

 end
