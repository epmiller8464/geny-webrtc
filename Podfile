# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'

target 'geny-webrtc' do
	pod 'libjingle_peerconnection'
	pod 'SocketRocket'
end

target 'geny-webrtcTests' do

end

post_install do |installer_representation|
    installer_representation.project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            config.build_settings['VALID_ARCHS'] = ['armv7' ,'armv7s', 'arm64']
        end
    end
end
