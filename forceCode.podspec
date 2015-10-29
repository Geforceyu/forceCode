Pod::Spec.new do |s|


s.name     = 'forceCode'


s.version  = '1.0'


s.license  = 'MIT'


s.summary  = 'geforceyus force code'


s.homepage = 'https://github.com/Geforceyu/forceCode'


s.authors  = { 'YuChonghua' => 'geforceyu@outlook.com' }


s.source   = { :git => 'https://github.com/Geforceyu/forceCode.git', :tag => 1.0 }


s.requires_arc = true


s.source_files =  'ForceCode/*.{h,m}'

s.platform = :ios
s.platform = :osx
s.ios.deployment_target = "7.0"
s.osx.deployment_target = "10.7"

end