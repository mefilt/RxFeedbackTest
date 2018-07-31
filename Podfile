# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

# Ignore all warnings from all pods
inhibit_all_warnings!

use_frameworks!(true)

# Enable the stricter search paths and module map generation for all pods
# use_modular_headers!

# Pods for WavesWallet-iOS
target 'RxFeedbackTest' do

    inherit! :search_paths
    # UI
    pod 'RxCocoa'
    pod 'RxDataSources'

    # Assisstant
    pod 'RxSwift'
    pod "RxSwiftExt"
    pod 'RxGesture'
    pod 'RxFeedback'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
          config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-O'
          config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'

        end
      end
    end
  end
