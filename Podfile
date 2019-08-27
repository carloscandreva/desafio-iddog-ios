platform :ios, '9.0'
project 'desafios-iddog.xcodeproj'
plugin 'cocoapods-binary'
inhibit_all_warnings!

def commomPods
  pod 'Alamofire', "~> 4.0"
  pod 'SwiftMessages', "~>6.0"
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
