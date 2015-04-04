Pod::Spec.new do |s|
  s.name            = 'libPusher-WebRTC'
  s.version         = '1.6'
  s.license         = 'MIT'
  s.summary         = 'An Objective-C client for the Pusher.com service'
  s.homepage        = 'https://github.com/Bill-SnowWolf/libPusher.git'
  s.author          = 'Bill-SnowWolf'
  s.source          = { :git => 'https://github.com/Bill-SnowWolf/libPusher.git', :tag => 'v1.6' }
  s.requires_arc    = true
  s.header_dir      = 'Pusher'
  s.default_subspec = 'Core'

  s.ios.deployment_target = '7.0'
  
  s.subspec 'Core' do |subspec|
    subspec.dependency 'SocketRocket', "0.3.1-beta2"
    
    subspec.source_files         = 'Library/**/*.{h,m}'
    subspec.private_header_files = 'Library/Private Headers/*'
    subspec.xcconfig             = { 
      'GCC_PREPROCESSOR_DEFINITIONS' => 'kPTPusherClientLibraryVersion=@\"1.6\"' 
    }
  end
  
  s.subspec 'ReactiveExtensions' do |subspec|
    subspec.dependency 'libPusher/Core'
    subspec.dependency 'ReactiveCocoa', '~> 2.1'

    subspec.source_files = 'ReactiveExtensions/*'
    subspec.private_header_files = '*_Internal.h'
  end
end
