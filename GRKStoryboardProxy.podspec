Pod::Spec.new do |s|
  s.name         = "GRKStoryboardProxy"
  s.version      = "1.0"
  s.summary      = "Allows separation of Storyboard files by loading view controllers from alternate storyboards."
  s.description  = <<-DESC
		A UIViewController subclass which can be used as a proxy for another view controller which resides
		in a separate Storyboard. At runtime, the proxy view controller will be replaced appropriately.
    DESC
  s.homepage     = "https://github.com/levigroker/GRKStoryboardProxy"
  s.license      = 'Creative Commons Attribution 3.0 Unported License'
  s.author       = { "Levi Brown" => "levigroker@gmail.com" }
  s.social_media_url = 'https://twitter.com/levigroker'
  s.source       = { :git => "https://github.com/levigroker/GRKStoryboardProxy.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.1'
  s.ios.deployment_target = '7.0'
  s.source_files = 'GRKStoryboardProxy/**/*.{h,m}'
  s.requires_arc = true
end
