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
      ss.vendored_frameworks ='./prebuilt/bundle-apple-framework-ios/ffmpegkit.framework',
                              './prebuilt/bundle-apple-framework-ios/libavcodec.framework',
                              './prebuilt/bundle-apple-framework-ios/libavdevice.framework',
                              './prebuilt/bundle-apple-framework-ios/libavfilter.framework',
                              './prebuilt/bundle-apple-framework-ios/libavformat.framework',
                              './prebuilt/bundle-apple-framework-ios/libavutil.framework',
                              './prebuilt/bundle-apple-framework-ios/libswresample.framework',
                              './prebuilt/bundle-apple-framework-ios/libswscale.framework'
      ss.ios.deployment_target = '12.1'
  end
end
