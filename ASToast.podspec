Pod::Spec.new do |s|

    s.name              = 'ASToast'
    s.version           = '0.0.4'
    s.summary           = 'Custom view for Android style toasts for iOS'
    s.homepage          = 'https://github.com/abdullahselek/ASToast'
    s.license           = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            = {
        'YOURNAME' => 'Abdullah SELEK'
    }
    s.source            = {
        :git => 'https://github.com/abdullahselek/ASToast.git',
        :tag => '0.0.4'
    }
    s.ios.deployment_target = '8.0'
    s.source_files      = 'ASToast/ASToast.swift, ASToast/ASToast.h'
    s.requires_arc      = true

end