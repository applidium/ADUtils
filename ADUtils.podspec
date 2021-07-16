Pod::Spec.new do |spec|
  spec.name         = 'ADUtils'
  spec.version      = '11.2.0'
  spec.authors      = 'Fabernovel'
  spec.homepage     = 'https://github.com/faberNovel/ADUtils'
  spec.summary      = 'Fabernovel\'s toolbox for iOS'
  spec.ios.deployment_target = '10.0'
  spec.tvos.deployment_target = '10.0'
  spec.license      = { :type => 'MIT', :text => 'Created and licensed by Fabernovel Technologies. Copyright 2014-2018 Fabernovel Technologies. All rights reserved.' }
  spec.source       = { :git => 'https://github.com/faberNovel/ADUtils.git', :tag => "v#{spec.version}" }
  spec.framework    = 'Foundation', 'UIKit'
  spec.requires_arc = true
  spec.default_subspec = 'objc'
  spec.swift_versions = ['5.0', '5.1']

  spec.subspec 'Swift' do |subspec|
    # Subspec compliant with App extensions
    subspec.source_files = 'Modules/ADUtils/*.{h,m,swift}'
  end

  spec.subspec 'Security' do |subspec|
    subspec.source_files = 'Modules/ADUtils_security/*.{h,m,swift}'
  end

  spec.subspec 'objc' do |subspec|
    subspec.dependency 'ADUtils/Swift'
	subspec.source_files = 'Modules/ADUtils_objc/*.{h,m,swift}'
  end

end
