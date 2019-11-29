platform :ios, '12.1'
use_frameworks!
inhibit_all_warnings!

def commomPods
  pod 'lottie-ios'
  pod 'SwiftLint', "~>0.30.1"
  pod 'Kingfisher', "~>5.1"
  pod 'SwiftMessages', "~>6.0"
  pod 'Reachability', "~>3.2"
end

target 'genericAppForInterview' do

  commomPods

  target 'genericAppForInterviewTests' do
    inherit! :complete
  end

  target 'genericAppForInterviewUITests' do
    inherit! :complete
  end
end
