#
# Be sure to run `pod lib lint YQLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YQLogger'
  s.version          = '0.2.0'
  s.summary          = 'YQLogger.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'YQLogger logging 辅助工具'

  s.homepage         = 'https://github.com/yuyedaidao/YQLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wyq' => 'wyqpadding@gmail.com' }
  s.source           = { :git => 'https://github.com/yuyedaidao/YQLogger.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'YQLogger/Sources/*'
  
  # s.resource_bundles = {
  #   'YQLogger' => ['YQLogger/Assets/*']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'Logging', '~> 1.4'
end
