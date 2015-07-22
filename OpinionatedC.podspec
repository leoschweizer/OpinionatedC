Pod::Spec.new do |s|
  s.name         = 'OpinionatedC'
  s.version      = '0.1.0'
  s.summary      = ''
  s.description  = ''
  s.homepage     = 'https://github.com/leoschweizer/OpinionatedC'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Leo Schweizer' => 'leonhard.schweizer@gmail.com' }
  s.source       = { :git => 'https://github.com/leoschweizer/OpinionatedC.git', :tag => s.version.to_s }

  s.ios.deployment_target = '4.0'
  s.osx.deployment_target = '10.6'

  s.requires_arc = true

  s.source_files = 'Lib', 'Lib/**/*.{h,m}'
  
end

