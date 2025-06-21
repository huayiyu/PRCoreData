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
  
  # 关键修复1: 确保source指向正确的Git仓库
  s.source       = {
    :git => 'https://github.com/huayiyu/PRCoreData.git',
    :tag => s.version.to_s
  }
  
  s.ios.deployment_target = '12.0'
  
  # 关键修复2: 正确指定预编译框架路径
  s.vendored_frameworks = 'PRCoreData.framework'
  
  # 关键修复3: 移除或修正resources声明
  # 如果确实没有资源文件，完全移除这行
  # 如果有资源文件，确保路径正确
  # s.resources = 'PRCoreData.framework/*.momd'
  
# 关键修复点3: 正确处理Core Data模型文件
  # 如果模型文件已编译到框架中，可以注释掉这行
  # 如果模型文件需要单独分发，确保路径正确
  s.resources = 'PRCoreData.framework/PRCoreData.xcdatamodeld'

  # 关键修复4: 修正头文件路径
  # 使用相对于框架的路径
  s.public_header_files = 'PRCoreData.framework/Headers/*.h'
  
  # 关键修复5: 添加source_files声明
  s.source_files = 'PRCoreData.framework/Headers/*.h'
  
  # 关键修复6: 添加必要的系统框架依赖
  s.frameworks = 'CoreData'
  
  # 即使主要是Objective-C，也建议添加Swift版本声明
  s.swift_version = '5.0'
  
  # 可选: 如果框架包含模块映射文件
  # s.module_map = 'PRCoreData.framework/Modules/module.modulemap'
end