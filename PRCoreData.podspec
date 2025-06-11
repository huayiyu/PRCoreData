Pod::Spec.new do |s|
  s.name         = 'PRCoreData'
  s.version      = '1.0.14'
  s.summary      = 'Re-encapsulated Objective-C library based on CoreData.'
  s.description  = <<-DESC
    PRCoreData is a powerful iOS Objective-C CoreData wrapper library.
  DESC
  s.homepage     = 'https://github.com/huayiyu/PRCoreData'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Hao Hui' => 'haohuihfit@outlook.com' }
  
  # 1. 指定预编译框架和资源文件
  s.source       = {
    :git => 'https://github.com/huayiyu/PRCoreData.git',
    :tag => s.version.to_s
  }
  s.ios.deployment_target = '12.0'
  
  # 2. 声明预编译框架（确保路径正确）
  s.vendored_frameworks = 'PRCoreData.framework'
  
  # 3. 处理 Core Data 模型文件（关键！）
  # 方式一：如果模型文件已编译到框架中，无需额外声明
  # 方式二：如果模型文件需单独分发
  s.resources = 'PRCoreData.framework/PRCoreData.xcdatamodeld'  # 替换为实际路径
  
  # 4. 添加必要的链接和编译设置
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',  # 确保加载所有 Objective-C 符号
    'COREDATA_ENABLE_MODELS' => 'YES'  # 启用 Core Data 模型支持
  }
  
  # 5. 如果框架依赖其他库（如系统库）
  s.frameworks = 'CoreData'