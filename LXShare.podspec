#
# Be sure to run `pod lib lint LXShare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LXShare'
  s.version          = '0.0.5'
  s.summary          = '工具集合'

  s.description      = <<-DESC
   
                         简介：LXShare是集合日常开发所需的工具集合
                    
                       DESC

  s.homepage         = 'https://github.com/hfdz1011/LXShare'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hfdz1011' => '18576722857@163.com' }
  s.source           = { :git => 'https://github.com/hfdz1011/LXShare.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'LXShare/Classes/LXMangerHeader.h'
  s.source_files = 'LXShare/Classes/*{h,m}'


  # s.resource_bundles = {
  #   'LXShare' => ['LXShare/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#   s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Masonry'
   s.dependency 'DateTools'
   
   #添加友盟分享----开始
   #  友盟基础库
#   s.dependency 'UMCommon'
#   s.dependency 'UMPush'
#   s.dependency 'UMDevice'
#   s.dependency 'UMAPM'
#   s.dependency 'UMCCommonLog'
#   s.dependency 'UMCSecurityPlugins'
   #  友盟分享库
#   s.dependency 'UMShare/Social/WeChat'

#   ---------------结束
   
end
