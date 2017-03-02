Pod::Spec.new do |s|

    s.name                = 'ASToast'
    s.version             = '1.0.9'
    s.summary             = 'A Swift extension for using Android style Toast notifications'
    s.homepage            = 'https://github.com/abdullahselek/ASToast'
    s.license             = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author              = {
        'Abdullah Selek' => 'abdullahselek@yahoo.com'
    }
    s.source              = {
        :git => 'https://github.com/abdullahselek/ASToast.git',
        :tag => s.version.to_s
    }
    s.ios.deployment_target = '8.0'
    s.source_files        = 'ASToast/Source/*.swift'
    s.requires_arc        = true

end