#forceCode.podspec
Pod::Spec.new do |s|
s.name         = "forceCode"
s.version      = "dev_ych"
s.summary      = "geforceyu's force code'"

s.homepage     = "https://github.com/Geforceyu/forceCode"
s.license      = 'MIT'
s.author       = { "Geforceuy" => "Geforceyu@outlook.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/Geforceyu/forceCode.git", :tag => s.version}
s.source_files  = 'forceCode/*.{h,m}'
s.requires_arc = true
end