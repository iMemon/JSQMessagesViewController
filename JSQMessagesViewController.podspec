Pod::Spec.new do |s|
	s.name = 'JSQMessagesViewController'
	s.version = '7.3.4'
	s.summary = 'An elegant messages UI library for iOS.'
	s.homepage = 'https://github.com/iMemon/JSQMessagesViewController'
	s.license = 'MIT'
	s.platform = :ios, '9.0'

	s.author = 'Ayaz Ahmed'
	s.social_media_url = 'https://twitter.com/ayazahmed313'

	s.screenshots = ['https://raw.githubusercontent.com/iMemon/JSQMessagesViewController/develop/Screenshots/screenshot0.png',
                    'https://raw.githubusercontent.com/iMemon/JSQMessagesViewController/develop/Screenshots/screenshot1.png',
                    'https://raw.githubusercontent.com/iMemon/JSQMessagesViewController/develop/Screenshots/screenshot2.png',
                    'https://raw.githubusercontent.com/iMemon/JSQMessagesViewController/develop/Screenshots/screenshot3.png']

	s.source = { :git => 'https://github.com/iMemon/JSQMessagesViewController.git', :tag => s.version }
	s.source_files = 'JSQMessagesViewController/**/*.{h,m}'

	s.resources = ['JSQMessagesViewController/Assets/JSQMessagesAssets.bundle', 'JSQMessagesViewController/**/*.{xib}']

	s.frameworks = 'QuartzCore', 'CoreGraphics', 'CoreLocation', 'MapKit', 'AVFoundation'
	s.requires_arc = true

	s.dependency 'JSQSystemSoundPlayer', '~> 2.0.1'
end
