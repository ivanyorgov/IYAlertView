#
# Be sure to run `pod lib lint IYAlertView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IYAlertView"
  s.version          = "0.3.0"
  s.summary          = "IYAlertView manages UIAlertView and UIAlertController with blocks"
  s.description      = <<-DESC
                       IYAlertView is used to for both UIAlertView and UIAlertController.
                    If the iOS version is newer than 8.0 it automatically uses the UIAlertController for presenting alert.
                    It also uses only block for the actions of the buttons.
                    DESC
  s.homepage         = "https://github.com/ivanyorgov/IYAlertView"
  s.license          = 'MIT'
  s.author           = { "ivan yorgov" => "stubborn@mail.bg" }
  s.source           = { :git => "https://github.com/ivanyorgov/IYAlertView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'IYAlertView' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
