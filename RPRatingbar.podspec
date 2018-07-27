Pod::Spec.new do |s|
  s.name         = 'RPRatingbar'
  s.framework  = "Foundation"
  s.version      = '1.0.0'
  s.summary      = 'RPRatingbar is a Ratingview in User Feedback'
  s.homepage     = 'https://github.com/patelravi20/RatingBar.git'
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Ravi Patel" => "patelravip20@gmail.com" }
  s.source           = { :git => 'https://github.com/patelravi20/RatingBar.git'}
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source_files = "CustomRatingControlExample/CustomRatingControlExample/Controller/Rating Controller/*.swift"
  s.requires_arc = true
end
