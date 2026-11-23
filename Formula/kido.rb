class Kido < Formula
  desc "Run macOS command-line tools in small Darwin VMs"
  homepage "https://kido.sh"
  url "https://github.com/kido-sh/kido/releases/download/v0.1.0/kido-0.1.0-darwin-arm64.tar.gz"
  sha256 "8ad4ecd1f66c0efc3946a9f458cd9f3f958392028867b228dd3219bf4e1ab03e"
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
