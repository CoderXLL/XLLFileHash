Pod::Spec.new do |s|

  s.name         = "XLLFileHash"
  s.version      = "1.1.3"
  s.summary      = "A short description of XLLFileHash."
  s.description  = <<-DESC
 			XLLFileHash.
                   DESC

  s.homepage     = "https://github.com/b593771943/XLLFileHash"
  s.license      = "MIT"

  s.author             = { "iOS-肖乐乐" => "m15822049431@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/b593771943/XLLFileHash.git", :tag => "#{s.version}" }

   s.subspec 'Core' do |ss|
        ss.source_files = 'XLLFileHash/*.{h}'
        ss.vendored_libraries = 'XLLFileHash/libXLLFileHash.a'
    end
 s.requires_arc = true

end
