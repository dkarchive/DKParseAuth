
Pod::Spec.new do |s|

  s.name         = "DKParseAuth"
  s.version      = "0.1"
  s.summary      = "Simple Parse Authentication"
  s.description  = "Add Parse auth to your iOS app with just a few lines :-)"

  s.homepage     = "https://github.com/dkhamsing/DKParseAuth"

  s.license      = { :type => "MIT", :file => "LICENSE" }
 
  s.author             = { "dkhamsing" => "dkhamsing8@gmail.com" }
  s.social_media_url   = "http://twitter.com/dkhamsing" 

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/dkhamsing/DKParseAuth.git", :tag => s.version.to_s }
 
  s.source_files  = "DKParseAuth/*"
   
  s.requires_arc = true
  
  s.dependency 'Parse', '~> 1.9'
  s.dependency 'ParseTwitterUtils', '~> 1.9'
  s.dependency 'DKTwitterReverseAuth', '~> 0.1'
  s.dependency 'DKHud', '~> 0.1'
  s.dependency 'DKAuthenticationViewController', '~> 0.2'
  
end
