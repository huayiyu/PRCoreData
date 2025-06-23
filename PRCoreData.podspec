Pod::Spec.new do |s|
  s.name         = 'PRCoreData'
  s.version      = '1.0.18'
  s.summary      = 'Re-encapsulated Objective-C library based on CoreData.'
  s.description  = <<-DESC
    PRCoreData is a powerful iOS Objective-C CoreData wrapper library.
  DESC
  s.homepage     = 'https://github.com/huayiyu/PRCoreData'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Hao Hui' => 'haohuihfit@outlook.com' }
  
  s.source       = {
    :git => 'https://github.com/huayiyu/PRCoreData.git',
    :tag => s.version.to_s
  }
  
  s.ios.deployment_target = '12.0'

  # █ 核心配置（严格匹配图片中的文件结构）
  s.vendored_frameworks = 'PRCoreData.framework'
  s.preserve_paths = 'PRCoreData.framework'
  
  # █ 头文件配置（匹配图片中的Headers目录）
  s.public_header_files = 'PRCoreData.framework/Headers/*.h'
  s.source_files = 'PRCoreData.framework/Headers/*.h'

  # █ 签名与架构配置（解决验证错误）
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'NO', # 禁用模块化
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', # 排除模拟器arm64
    'CODE_SIGNING_REQUIRED' => 'NO', # 禁用代码签名
    'VALID_ARCHS' => 'arm64 armv7' # 仅真机架构
  }

  # █ 资源文件配置（匹配图片中的PRCoreData.momd）
  s.resources = 'PRCoreData.framework/PRCoreData.momd'
  
  # █ 系统依赖（必须）
  s.frameworks = 'CoreData', 'Foundation'
  #s.libraries = 'z', 'sqlite3'
  
  # █ 彻底禁用Swift干扰
  s.swift_version = nil
  s.module_map = nil
  
  # █ 签名豁免（关键修复）
  s.user_target_xcconfig = {
    'CODE_SIGNING_ALLOWED' => 'NO'
  }
end