platform :ios, '9.0'

def testing_pods
    pod 'Quick'
    pod 'Nimble', :inhibit_warnings => true
end

target 'ASToast' do
  	use_frameworks!

  	# Pods for ASToast

  	target 'ASToastTests' do
    	inherit! :search_paths
    	testing_pods
  	end

end
