Pod::Spec.new do |s|
  s.name         = 'PRCoreData'
  s.version      = '1.0.15'
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
  
  # 关键修复点1: 确保部署目标至少12.0
  s.ios.deployment_target = '12.0'
  
  # 关键修复点2: 正确指定预编译框架
  s.vendored_frameworks = 'PRCoreData.framework'
  
  # 关键修复点3: 正确处理Core Data模型文件
  # 如果模型文件已编译到框架中，可以注释掉这行
  # 如果模型文件需要单独分发，确保路径正确
  s.resources = 'PRCoreData.framework/PRCoreData.xcdatamodeld'
  
  # 关键修复点4: 明确指定公开头文件
  s.public_header_files = 'PRCoreData.framework/Headers/*.h'
  
  # 关键修复点5: 添加必要的系统框架依赖
  s.frameworks = 'CoreData'
  
  # 关键修复点6: 即使主要是Objective-C，也建议添加Swift版本声明
  s.swift_version = '5.0'
  
  # 可选: 如果框架包含模块映射文件
  # s.module_map = 'PRCoreData.framework/Modules/module.modulemap'
end