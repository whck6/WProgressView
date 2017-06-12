Pod::Spec.new do |s|
  s.name     = 'WProgressView'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A circle progress view.'
  s.homepage = 'https://github.com/whhotw/WProgressView'
  s.author   = { 'Wenhao Ho' => 'wh.ho@outlook.com' }
  s.source   = { :git => 'https://github.com/whhotw/WProgressView.git', :tag => s.version.to_s }
  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'WProgressView/*.{h,m}'
  s.ios.deployment_target = "8.0"
end
