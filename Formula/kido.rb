class Kido < Formula
  desc "Run macOS command-line tools in small Darwin VMs"
  homepage "https://kido.sh"
  url "https://github.com/kido-sh/kido/releases/download/v0.1.1/kido-0.1.1-darwin-arm64.tar.gz"
  sha256 "8bd845fa77905feb13214d33daba19a551580f9a1710adb59744af177c2a86d1"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bin/kido"
    (libexec/"kido").install "libexec/kido/kido-agent", "libexec/kido/kido-vmm"
    doc.install "share/doc/kido/README.md", "share/doc/kido/LICENSE"
  end

  def caveats
    <<~EOS
      Run `kido setup` once. It pulls the Darwin image, a download of about 40 MB.
    EOS
  end

  test do
    assert_equal "kido version #{version}", shell_output("#{bin}/kido --version").strip
  end
end
