Pod::Spec.new do |s|
  s.name             = "BTLoading"
  s.version          = "0.3.4"
  s.summary          = "An easy Loading View"
  s.homepage         = "https://github.com/StoneMover/BTLoading"
  s.license          = 'MIT'
  s.author           = {"StoneMover" => "stonemover@163.com"}
  s.platform         = :ios, '9.0'
  s.source           = {:git => "https://github.com/StoneMover/BTLoading.git", :tag => s.version }
  s.source_files     = 'Classes/**/*.{h,m}'
  s.resource = 'Assets/BTLoadingBundle.bundle'
  s.requires_arc     = true
  s.public_header_files = 'Classes/**/*.h'
end