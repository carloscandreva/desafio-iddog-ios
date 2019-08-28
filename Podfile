platform :ios, '12.1'
use_frameworks!
inhibit_all_warnings!

def commomPods
  pod 'Alamofire', "~> 4.0"
  pod 'SwiftLint', "~>0.30.1"
  pod 'Kingfisher', "~>5.1"
  pod 'SwiftMessages', "~>6.0"
  pod 'Reachability', "~>3.2"
end

target 'desafios-iddog' do

  commomPods

  target 'desafios-iddogTests' do
    inherit! :complete
  end

  target 'desafios-iddogUITests' do
    inherit! :complete
  end
end
