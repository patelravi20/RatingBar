Pod::Spec.new do |s|
  s.name         = 'RPRatingbar'
  s.version      = "1.0.0"
  s.summary      = "A short description of RPRatingbar."
DESC
  s.homepage     = "https://github.com/patelravi20/RatingBar"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Ravi Patel" => "patelravip20@gmail.com" }
  s.source           = { :git => 'https://github.com/vishalkalola1/DrawPDF.git', :branch  => "master", :tag => "1.7"}
  s.platform     = :ios
  s.sources_files = "Sources/*.swift"
  s.requires_arc = true
end
