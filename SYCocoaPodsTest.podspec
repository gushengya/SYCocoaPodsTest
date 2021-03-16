# 一定要运行'pod spec lint SYCocoaPodsTest.podspec'以确保这是一个有效的规范，并在提交规范之前删除包含此内容的所有评论。
# 要了解关于Podspec属性的更多信息，请参见https://guides.cocoapods.org/syntax/podspec.html
# 要查看CocoaPods repo中工作的Podspecs，请参见https://github.com/CocoaPods/Specs/

Pod::Spec.new do |spec|

# 项目名称是必须填写的，可以通过pod search找到(必填)
  spec.name         = "SYCocoaPodsTest"

# 项目版本号一定要与push tag的版本号一致(必填)
  spec.version      = "0.0.2"

# 项目的简述不要与description描述一致，且长度要比descrition要短，否则发警告
  spec.summary      = "测试用的"

# 该描述用于生成标签和改进搜索结果。
# 思考:它能做什么?你为什么要写它?重点是什么?
# 尽量保持简短、利落、直奔主题。
# 在下面DESC分隔符之间写入描述。
# 最后，不要担心缩进，CocoaPods会把它剥掉!
  spec.description  = <<-DESC
			# descrition描述，可以在此处添加你所更新的重要模块描述。
			"0.0.1: 只有一个简单的Class用来打印一个AAA, 不依赖任何库也不添加任何bundle
             0.0.2: 添加bundle以及众多文件，但不区分文件夹"
                   DESC

# 项目主页，可以写github个人主页
  spec.homepage     = "https://github.com/gushengya/SYCocoaPodsTest.git"

# 屏幕截图，如果喜欢可以添加，但是必须是网络图片即http或https开头的，不能是本地的图片(选填)
  # spec.screenshots  = "http://www.example.com/screenshots_1.gif", "https://www.example.com/screenshots_2.gif"


# ―――  授权协议：项目遵守的开源协议(必填)  ―――――――――――――――――――――――――――――――― #
  #spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


# ――― 项目开发者，可添加协作者  ――――――――――――――――――――――――――――――――――――――――― #
# 指定人员名与邮箱
  spec.author             = { "Bleiler" => "759705236@qq.com" }
  # Or just: spec.author    = "Bleiler"
  # spec.authors            = { "Bleiler" => "759705236@qq.com" }
  # spec.social_media_url   = "https://twitter.com/Bleiler"

# ――― 使用平台，所支持的最低版本，版本号必填，如没有其他平台则不写 ――――――――――――― #
  spec.platform     = :ios, "8.0"

# 当支持其他平台时，配置所支持的平台的最低版本，版本号必填，如果没有其他平台则可不写
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


# ――― 资源路径 ―――――――――――――――――――――――――――――――――――――――――――――――――――――― #
# pod就是根据这个配置才能找到你的项目文件，进而copy到使用者的工程内
# 资源路径可以指向远端代码库也可以指向本地项目
# 项目源代码位置一般就是一个github地址(:commit => "686868" 表示将这个Pod版本与Git仓库中某个commit绑定、:tag => 1.0.0表示与某个版本的commit绑定)
  spec.source       = { :git => "https://github.com/gushengya/SYCocoaPodsTest.git", :tag => "#{spec.version}" }
  
# 可以在远程打上tag之前先用commit值测试一下是否好使
  # spec.source       = { :git => "https://github.com/gushengya/SYCocoaPodsTest.git", :commit => "686868" }
  # spec.source = { :path => ""}


# ――― 资源文件路径和头文件路径, 如果引入分组模式则该段不填(必填) ―――――――――――――― #
# 项目主要文件(*表示匹配所有文件、*.h表示匹配所有.h文件、*.{h,m}表示匹配所有.h和.m文件、**表示匹配所有子目录)
  spec.source_files  = "SYCocoaPodsTest", "SYCocoaPodsTest/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"

# ――― 分组模式, 即将子文件夹展示 ――― #
# 说明：开发SDK的时候需要注意，如果是分组形式，一定要分清依赖关系，切记不可相互依赖！
# 如果不是分组形式，那不用去约束依赖关系，直接把工程中的所有文件引入即可
  # spec.subspec 'A' do |a|
  # 引入A文件夹下的所有文件，包括子文件夹里的文件
  # 如果只公开.h和.m文件的话也可以使用["SYCocoaPodsTest/SYCocoaPodsTest/A/**/*.{h,m}"]
  # a.source_files = ["SYCocoaPodsTest/SYCocoaPodsTest/A/**/*"]
  # a.public_header_files = ["SYCocoaPodsTest/SYCocoaPodsTest/A/**/*.h"]
  # a.dependency 'SYCocoaPodsTest/B'
  # a.dependency 'SYCocoaPodsTest/C'
  # end

  # spec.subspec 'B' do |b|
  # 引入A文件夹下的所有文件，包括子文件夹里的文件
  # 如果只公开.h和.m文件的话也可以使用["SYCocoaPodsTest/SYCocoaPodsTest/B/**/*.{h,m}"]
  # b.source_files = ["SYCocoaPodsTest/SYCocoaPodsTest/B/**/*"]
  # b.public_header_files = ["SYCocoaPodsTest/SYCocoaPodsTest/B/**/*.h"]
  # b.dependency 'SYCocoaPodsTest/C'
  # end

  # spec.subspec 'C' do |c|
  # 引入A文件夹下的所有文件，包括子文件夹里的文件
  # 如果只公开.h和.m文件的话也可以使用["SYCocoaPodsTest/SYCocoaPodsTest/C/**/*.{h,m}"]
  # c.source_files = ["SYCocoaPodsTest/SYCocoaPodsTest/C/**/*"]
  # c.public_header_files = ["SYCocoaPodsTest/SYCocoaPodsTest/C/**/*.h"]
  # end

# ――― 图片资源文件路径，如果引用图片就填写 ―――――――――――――――――――――――――――― #
# 这里有个注意事项:
# resource资源路径是相对于podspec文件而言的，如果与podspec同级的文件夹直接写同级文件夹名
# 如果资源存在次级目录中, 需要在中间加上**表示中间还有别的目录
  # spec.resource  = 'SYCocoaPodsTest/Bundles/SYImageBundle.bundle'
  # spec.resources = "Resources/*.png" 
  spec.resources = ["SYCocoaPodsTest/**/*.bundle"] # 建议把图片资源文件写成bundle包形式

# 保存文件路径，不知含义
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


# ――― 依赖的系统库 ――――――――――――――――――――――――――――――――――――――――――― #
  # spec.framework  = "UIKit"   # 单个framework
  # spec.frameworks = "SomeFramework", "AnotherFramework"  # 多个framework

  # spec.library   = "iconv" # 单个library
  # spec.libraries = "iconv", "xml2" # 多个library


# ――― 是否需要支持arc ―――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true  

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

# 所依赖的其他三方库
# 第三方库的版本号最好也写上，防止不必要的错误
  # spec.dependency "FMDB", "~> 2.7.5"

end
