class Krasnodar < Formula
  include Language::Python::Virtualenv

  desc "Putting your mac to sleep when you say Krasnodar out loud"
  homepage "https://github.com/alagunto/homebrew-krasnodar/"
  url "https://github.com/alagunto/homebrew-krasnodar/archive/master.tar.gz"
  version "1.0.0"
  sha256 ""
  license "MIT"

  depends_on "python"
  depends_on "portaudio"
  depends_on "sox"

  resource "PyAudio" do
    url "https://files.pythonhosted.org/packages/ab/42/b4f04721c5c5bfc196ce156b3c768998ef8c0ae3654ed29ea5020c749a6b/PyAudio-0.2.11.tar.gz"
    sha256 "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resource("PyAudio")
    venv.pip_install_and_link buildpath
  end

  def plist_name
    "homebrew.krasnodar." + name
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
       <string>#{libexec}/venv/bin/python</string>
       <string>#{prefix}/</string>
     </array>
     <key>RunAtLoad</key>
     <true />
     <key>KeepAlive</key>
     <true />
     <key>StandardErrorPath</key>
     <string>/dev/null</string>
     <key>StandardOutPath</key>
     <string>/dev/null</string>
     <key>WorkingDirectory</key>
     <string>#{prefix}</string>
   </dict>
   </plist>
   EOS
  end

  test do
    system "true"
  end
end
