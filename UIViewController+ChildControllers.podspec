Pod::Spec.new do |s|
  s.name             = "UIViewController+ChildControllers"
  s.version          = "1.0.0"
  s.summary          = "UIViewController+ChildControllers helps you out when you need to present child controllers."
  s.homepage         = "https://github.com/bilby91/UIViewController-ChildControllers"
  s.license          = 'MIT'
  s.author           = { "Martin Fernandez" => "me@bilby91.com" }
  s.source           = { :git => "https://github.com/bilby91/UIViewController-ChildControllers.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/bilby91'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.frameworks = 'UIKit'
end
