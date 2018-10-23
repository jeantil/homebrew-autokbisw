class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for OSX"
  homepage "https://github.com/jeantil/autokbisw"
  url "https://github.com/jeantil/autokbisw/archive/1.2.0.tar.gz"
  version "1.2.0"
  sha256 "acb0e2d34472c86bdce9bbe8c04b0a22af60901288ae21e087fc677a297fc17f"
    
  bottle do
    root_url 'https://github.com/jeantil/autokbisw/releases/download/1.2.0'
    sha256 'acb0e2d34472c86bdce9bbe8c04b0a22af60901288ae21e087fc677a297fc17f' => :mavericks
  end

  depends_on :xcode
    
  def install
    system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end
    
  test do
    system bin/"autokbisw", "--help"
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/autokbisw</string>
        </array>
        <!--
        <string>--location</string>
        <string>-v</string>
        -->   
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <!--
        <key>StandardOutPath</key>
        <string>/usr/local/var/log/autokbisw.log</string>
        <key>StandardErrorPath</key>
        <string>/usr/local/var/log/autokbisw.log</string>
        -->
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
      </dict>
    </plist>
    EOS
  end
end

