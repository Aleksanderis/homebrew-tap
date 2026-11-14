# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.1/gitunia-0.11.1-osx-arm64.tar.gz"
      sha256 "22e2932a1ac1f13a2c6e18f4096c8c2e7b4b51b7959358640c953bcb0761c775"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.1/gitunia-0.11.1-linux-x64.tar.gz"
      sha256 "c2e610d1596fccbd2f8a6f53c15e2275d3b4b873be7b736aaac63f0faecdd4ad"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.1/gitunia-0.11.1-linux-arm64.tar.gz"
      sha256 "a76999a2d013c08480aeade3ccab39084171163393b9277d17dccbbf608b3a6a"
    end
  end

  depends_on "git"

  def install
    bin.install "gitunia"
  end

  def caveats
    <<~EOS
      The macOS binary is not signed or notarised. If macOS blocks it, run:
        xattr -d com.apple.quarantine "$(which gitunia)"
    EOS
  end

  test do
    assert_match "gitunia #{version}", shell_output("#{bin}/gitunia --version")
  end
end
