require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = 'ffmpeg-kit-full-gpl'
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform                  = :ios, '13.0'
  s.ios.deployment_target     = '13.0'
  s.requires_arc              = true
  s.static_framework          = true

  s.source = { :http => "https://github.com/jdarshan5/ffmpeg-kit-react-native/releases/download/rn-binaries/ffmpeg-full-gpl-6-0-2.zip" }

  s.libraries = [
    "z",
    "bz2",
    "c++",
    "iconv"
  ]
  s.frameworks = [
    "AudioToolbox",
    "AVFoundation",
    "CoreMedia",
    "VideoToolbox"
  ]
  s.vendored_frameworks = [
    "ffmpegkit.xcframework",
    "libavcodec.xcframework",
    "libavdevice.xcframework",
    "libavfilter.xcframework",
    "libavformat.xcframework",
    "libavutil.xcframework",
    "libswresample.xcframework",
    "libswscale.xcframework",
  ]
end
