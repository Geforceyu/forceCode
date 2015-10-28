Pod::Spec.new do |s|
  s.name     = 'forceCode'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'geforceyus force code'
  s.homepage = 'https://github.com/Geforceyu/forceCode'
  s.social_media_url = 'https://github.com/Geforceyu/forceCode'
  s.authors  = { 'Geforceyu' => '564678164@qq.com' }
  s.source   = { :git => 'https://github.com/Geforceyu/forceCode.git', :tag => s.version, :submodules => true }
  s.requires_arc = true
  
  s.public_header_files = 'forceCode/ForceCode.h'
  s.source_files = 'forceCode/ForceCode.h'
