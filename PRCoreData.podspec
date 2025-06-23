Pod::Spec.new do |s|
  s.name         = 'PRCoreData'
  s.version      = '1.0.17'
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
  
  # 关键修复1：明确声明为静态框架
  s.static_framework = true
  
  # 关键修复2：正确指定预编译框架
  s.vendored_frameworks = 'PRCoreData.framework'
  
  # 关键修复3：添加必要的链接器标志
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC -all_load -lz -lsqlite3',
    'VALID_ARCHS' => 'arm64 arm64e x86_64'
  }
  
  # 关键修复4：添加系统框架依赖
  s.frameworks = 'CoreData'
  
  # 关键修复5：正确设置头文件
  s.public_header_files = 'PRCoreData.framework/Headers/*.h'
  s.source_files = 'PRCoreData.framework/Headers/*.h'
  
  # 关键修复6：如果是纯Objective-C，移除Swift版本声明
  # 完全移除这行：s.swift_version = '5.0'
  
  # 可选：如果使用C++特性
  # s.library = 'c++'
  # 关键修复5：确保不包含 Swift 模块映射
  s.module_map = nil
end