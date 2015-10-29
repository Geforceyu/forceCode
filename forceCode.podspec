Pod::Spec.new do |s|


s.name     = 'forceCode'


s.version  = 'master'


s.license  = 'MIT'


s.summary  = 'geforceyus force code by 余崇华 联系我:564678164'


s.homepage = 'https://github.com/Geforceyu/forceCode'


s.authors  = { 'YuChonghua' => 'geforceyu@outlook.com' }


s.source   = { :git => 'https://github.com/Geforceyu/forceCode.git', :tag => 0.01, :submodules => true }


s.requires_arc = true


s.source_files =  'ForceCode/*.{h,m}'

s.platform = :ios
s.platform = :osx
s.ios.deployment_target = "7.0"
s.osx.deployment_target = "10.7"

end