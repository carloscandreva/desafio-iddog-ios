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

target 'desafiosIddog' do

  commomPods

  target 'desafiosIddogTests' do
    inherit! :complete
  end

  target 'desafiosIddogUITests' do
    inherit! :complete
  end
end
