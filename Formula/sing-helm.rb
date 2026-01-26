class SingHelm < Formula
  desc "Lightweight sing-box configuration manager and proxy client"
  homepage "https://github.com/kyson-dev/sing-helm"
  version "0.1.3"
  
  if Hardware::CPU.arm?
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.3/sing-helm-darwin-arm64"
    sha256 "3f180fcf606432bb56493b1a6f6112bd98de621ef053f07e4e00910f2bc80e91"
  else
    url "https://github.com/kyson-dev/sing-helm/releases/download/v0.1.3/sing-helm-darwin-amd64"
    sha256 "34652f58b0d046c616e73e306e00f086dc0beeac1014fa074b5a5769d4bf236e"
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
