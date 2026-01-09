class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.1.2"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.2/sing-helm-darwin-arm64"
    sha256 "506cf63ef9b88e2940d30bd01875c6bbd83e3cba303c1826a2c8e3b67ba09156"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.2/sing-helm-darwin-amd64"
    sha256 "253bd91c068ce426cd15327abb604a74a7fbc0447aa60ca79222fe78d39fad57"
  end

  def install
    bin.install "sing-helm-darwin-arm64" => "sing-helm" if Hardware::CPU.arm?
    bin.install "sing-helm-darwin-amd64" => "sing-helm" if Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      To start sing-helm as a system service:
        sudo sing-helm autostart on
      
      To run sing-helm manually:
        sudo sing-helm run
    EOS
  end

  test do
    system "#{bin}/sing-helm", "version"
  end
end
