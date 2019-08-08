Pod::Spec.new do |s|
 s.name = 'STPhotoDetails'
 s.version = '0.0.5'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Photo details for Streetography'
 s.homepage = 'https://streetography.com'
 s.social_media_url = 'https://streetography.com'
 s.authors = { "Streetography" => "info@streetography.com" }
 s.source = { :git => "https://github.com/mikelanza/st-photo-details-ios.git", :tag => s.version.to_s }
 s.platforms = { :ios => "11.0" }
 s.requires_arc = true
 s.swift_versions = ['5.0']

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.resource_bundles = { "STPhotoDetails" => ["Sources/**/*.{lproj,xcassets}"] }
     ss.dependency "STPhotoCore", "~> 0.1.0"
     ss.framework  = "Foundation"
 end
end
