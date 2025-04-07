require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/jdarshan5/ffmpeg-kit-react-native.git" }

  s.default_subspec   = 'local'

  s.dependency "React-Core"

  s.subspec 'local' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h', 'bundle-apple-xcframework-ios/**/*.{h,m,swift}'
      ss.vendored_frameworks ='bundle-apple-framework-ios/ffmpegkit.xcframework',
                              'bundle-apple-framework-ios/libavcodec.xcframework',
                              'bundle-apple-framework-ios/libavdevice.xcframework',
                              'bundle-apple-framework-ios/libavfilter.xcframework',
                              'bundle-apple-framework-ios/libavformat.xcframework',
                              'bundle-apple-framework-ios/libavutil.xcframework',
                              'bundle-apple-framework-ios/libswresample.xcframework',
                              'bundle-apple-framework-ios/libswscale.xcframework'
      ss.ios.deployment_target = '12.1'
  end
end
