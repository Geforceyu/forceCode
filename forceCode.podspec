Pod::Spec.new do |s|
  s.name     = 'forceCode'
  s.version  = 'master'
  s.license  = 'MIT'
  s.summary  = 'geforceyus force code'
  s.homepage = 'https://github.com/Geforceyu/forceCode'
  s.social_media_url = 'https://github.com/Geforceyu/forceCode'
  s.authors  = { 'Geforceyu' => '564678164@qq.com' }
  s.source   = { :git => 'https://github.com/Geforceyu/forceCode.git', :tag => master }
  s.requires_arc = true
  s.source_files =  '*.{h,m}'
end
