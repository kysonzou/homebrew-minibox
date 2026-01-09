class Minibox < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson/minibox"
  version "0.2.1"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson/minibox/releases/download/v0.2.1/minibox-darwin-arm64"
    sha256 "PLACEHOLDER_ARM64_SHA256"
  else
    url "https://github.com/kyson/minibox/releases/download/v0.2.1/minibox-darwin-amd64"
    sha256 "PLACEHOLDER_AMD64_SHA256"
  end

  def install
    bin.install "minibox-darwin-arm64" => "minibox" if Hardware::CPU.arm?
    bin.install "minibox-darwin-amd64" => "minibox" if Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      To start minibox as a system service:
        sudo minibox autostart on
      
      To run minibox manually:
        sudo minibox run
    EOS
  end

  test do
    system "#{bin}/minibox", "version"
  end
end
