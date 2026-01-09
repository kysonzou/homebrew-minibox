class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.1.1"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.1/sing-helm-darwin-arm64"
    sha256 "1a64788184b76f37bddb9270e28af028fddedc7b2d6d3884ff78ffc73678d100"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.1/sing-helm-darwin-amd64"
    sha256 "d2feb7194262cf467e0d99b426583f802f71266f57fcefc42a9357300e654ac8"
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
