use_frameworks!
inhibit_all_warnings!

target 'mapBoxTestTask' do
  pod 'Mapbox-iOS-SDK', '~> 6.4.0'
  pod 'Alamofire', '~> 5.4'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
