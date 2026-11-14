# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.4/gitunia-0.11.4-osx-arm64.tar.gz"
      sha256 "d597c97a7a26e0c1386e4424b53ceb62bf67180d915926b880adf977e1c7ca65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.4/gitunia-0.11.4-linux-x64.tar.gz"
      sha256 "7ca1ce7452e3bb1a448b80c4bc0d231126ce3c3ead753937f613ec75cb6d8405"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.4/gitunia-0.11.4-linux-arm64.tar.gz"
      sha256 "d57fcfb4f6b8b15e939b5dfd9468419129ebdd8ad75b9760ae69eaf31791a8fb"
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
