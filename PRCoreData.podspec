Pod::Spec.new do |s|
  # 基本信息
  s.name         = 'PRCoreData'       # 框架名称（必须和 .framework 文件名一致）
  s.version      = '1.0.0'             # 版本号（每次发布新版本需更新）
  s.summary      = 'Re encapsulated Objective C library based on CoreData.'  # 简短描述（显示在 CocoaPods 搜索列表）
  s.description  = <<-DESC
                      PRCoreData It is a powerful iOS Objective C CoreData wrapper library that makes CoreData more convenient to use and provides standardized APIs。
                    DESC
  s.homepage     = 'https://github.com/huayiyu/PRCoreData'  # 项目主页（GitHub 链接）
  s.license      = { :type => 'MIT', :file => 'LICENSE' }  # 开源协议（通常 MIT）
  s.author       = { 'Hao Hui' => 'haohuihfit@outlook.com' }  # 作者信息
  
  # 代码来源（Git 仓库 + tag）
  s.source       = {
    :git => 'https://github.com/huayiyu/PRCoreData.git', # git@github.com:huayiyu/PRCoreData.git https://github.com/huayiyu/PRCoreData.git
    :tag => s.version.to_s
  }
  
  # 支持的平台和版本
  s.ios.deployment_target = '12.0'  # 最低支持 iOS 12.0
  s.swift_version = '5.0'           # Swift 版本（如果是 Swift 项目）
  
  # 核心配置（选择一种方式）
  
  ## 方式1：直接包含源代码（推荐）
  s.source_files = 'PRCoreData.framework/**/*.{h,m,swift}'  # 源代码路径
  
  ## 方式2：使用预编译的 .framework（如果已经构建好二进制）
  # s.vendored_frameworks = 'PRCoreData.framework'
  
  # 依赖项（如果有）
  # s.dependency 'Alamofire', '~> 5.0'  # 例如依赖 Alamofire
end
