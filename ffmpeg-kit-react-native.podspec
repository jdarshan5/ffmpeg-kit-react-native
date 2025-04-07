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
                             '**/FFmpegKitReactNativeModule.h'
      ss.vendored_frameworks = '../../Desktop/FFmpeg-iOS-v6.0.4/ffmpegkit.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libavcodec.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libavdevice.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libavfilter.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libavformat.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libavutil.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libswresample.framework',
                              '../../Desktop/FFmpeg-iOS-v6.0.4/libswscale.framework'
      ss.ios.deployment_target = '12.1'
  end
end
