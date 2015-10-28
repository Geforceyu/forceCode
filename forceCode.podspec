FoPod::Spec.new do |s|
  s.name     = 'forceCode'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'geforceyus force code'
  s.homepage = 'https://github.com/Geforceyu/forceCode'
  s.social_media_url = 'https://github.com/Geforceyu/forceCode'
  s.authors  = { 'YuChonghua' => 'geforceyu@outlook.com' }
  s.source   = { :git => 'https://github.com/Geforceyu/forceCode.git', :tag => s.version }
  s.requires_arc = true
  s.source_files =  'ForceCode/*.{h,m}'
end
