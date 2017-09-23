#
# Be sure to run `pod lib lint TDCore.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "EDCore"
  s.version          = "1.0.1"
  s.summary          = "EDCore is a iOS framework. You have beauty project and stable. It will down time development for you"
  s.description      = "EDCore allows configure & create base to any iOS Project. Below are services needed to be implement basic funtion. so it's help to you can write short code and meanable. So you will the clear source code"
  s.homepage         = "https://github.com/EddieLukeAtmey/ELCore"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Eddie Luke Atmey" => "eddie.marvin116@gmail.com" }
  s.source           = { :git => "https://github.com/EddieLukeAtmey/EDCore", :tag => s.version.to_s }
  # s.social_media_url = 'https://fb.com/Eddie.Something'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'EDCore/*'

 s.subspec 'TDCategory' do |ss|
    ss.source_files = 'TDCategory/*'
  end

 s.subspec 'TDEngineLog' do |ss|
    ss.source_files = 'TDEngineLog/*'
  end 

 s.subspec 'TDEvent' do |ss|
    ss.source_files = 'TDEvent/*'
  end

 s.subspec 'TDPopup' do |ss|
    ss.source_files = 'TDPopup/*'
  end

 s.subspec 'TDUtils' do |ss|
    ss.source_files = 'TDUtils/*'
  end

  s.resource_bundles = {
    'TDCore' => ['Assets/*.png']
  }

  # s.public_header_files = 'EDCore/EDCore.h','TDBaseViewController/*.h','TDCategory/*.h','TDEngineLog/*.h','TDEvent/*.h','TDPopup/*.h','TDUtils/*.h','UITableViewDragLoad/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
