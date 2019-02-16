#
#  Be sure to run `pod spec lint VTAlertView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "VTAlertView"
  s.version      = "0.0.2"
  s.summary      = "A short description of VTAlertView."
  
  s.description  = <<-DESC
                    alertView
                   DESC

  s.homepage     = "https://www.wxzxzj.com"
  s.license      = "MIT"

  s.author       = { "xiaolidaodao" => "348389009@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaolidaodao/VTAlertView.git", :tag => "#{s.version}" }
  s.source_files  = "VTAlertView/**/*.{h,m}"
  s.requires_arc = true

  

end
