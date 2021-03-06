Pod::Spec.new do |s|
  
  s.name         = 'OpinionatedC'
  s.version      = '0.3.0'
  s.summary      = 'Because Objective-C should have inherited more from Smalltalk'
  s.description  = <<-DESC
                     OpinionatedC provides a number of categories that allow to write
                     more concise and readable code, inspired by Smalltalk.
                     At the moment, these are mostly collection methods like map:, 
                     reduce:, select:, reject:, each:, each:separatedBy:, anySatisfy:,
                     allSatisfy:, and many more. 
                   DESC
  s.homepage     = 'http://opinionatedc.xyz'
  s.social_media_url = 'https://twitter.com/leoschweizer' 
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Leo Schweizer' => 'leonhard.schweizer@gmail.com' }
  s.source       = { :git => 'https://github.com/leoschweizer/OpinionatedC.git', :tag => s.version }

  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.7'

  s.requires_arc = true

  s.source_files = 'Lib', 'Lib/**/*.{h,m}'
  
end
