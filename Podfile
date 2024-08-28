source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
 platform :ios, '17.5'

target 'UniverseSignal' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # 开启 modular headers。开启后 Pod 模块才能使用 @import 导入。
  use_modular_headers!

  # Pods for UniverseSig
  pod 'Moya','~> 15.0'# 网络底层
  pod 'Moya/Combine', '~> 15.0'# 网络底层结合SwiftUICombine
  pod 'KakaJSON'# JSON处理
  pod 'SwiftyJSON'# JSON处理
  pod 'SwifterSwift' # 语法糖

end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
end