platform :ios, '10.0'
use_frameworks!

target 'ADUtilsApp' do
    pod 'SwiftLint', '~> 0.42.0'
end

target 'ADUtilsTests' do
    pod 'Quick', '~> 2.2'
    pod 'Nimble', '~> 9.0'
    pod 'Nimble-Snapshots', '~> 9.0'
    pod 'OCMock', '~> 3.5'
    pod 'ADUtils', :path => './'
    pod 'ADUtils/Security', :path => './'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|

            # Change the Optimization level for each target/configuration
            if !config.name.include?("Distribution")
                config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
            end

            # Disable Pod Codesign
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        end
    end
end
