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
  
  # 关键修复1：明确排除资源编译
  s.resource = nil
  s.resources = nil
  s.resource_bundles = nil

  # 关键修复2：禁用Swift模块（如果是纯OC）
  s.module_map = nil
  s.swift_version = nil
  s.exclude_files = '**/*.xcdatamodeld' # 显式排除源文件

  # 关键修复1：明确声明为静态框架
  s.static_framework = true
  
  # 关键修复2：正确指定预编译框架
  s.vendored_frameworks = 'PRCoreData.framework'
  s.preserve_paths = 'PRCoreData.framework'

  # 关键修复3：添加必要的链接器标志
  # 关键修复4：添加CoreData链接标志
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC -all_load -lz -lsqlite3',
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/PRCoreData"',
    'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/PRCoreData"'
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