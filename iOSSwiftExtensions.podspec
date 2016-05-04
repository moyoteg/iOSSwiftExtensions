Pod::Spec.new do |s|
  s.name             = "iOSSwiftExtensions"
  s.version          = "0.1.0"
  s.summary          = "This is my coletion of useful Extensions."
  s.description      = "This is something I had to create to make it easy for me to use all my cool extensions =)."
  s.homepage         = "https://github.com/moyoteg/iOSSwiftExtensions"
  s.license          = 'MIT'
  s.author           = { "Moi" => "moyoteg@gmail.com" }
  s.source           = { :git => "https://github.com/moyoteg/iOSSwiftExtensions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/moyoteg'
  s.ios.deployment_target = '8.0'
  s.source_files = 'iOSSwiftExtensions/Classes/**/*'

end
