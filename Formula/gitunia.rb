# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.16.0/gitunia-0.16.0-osx-arm64.tar.gz"
      sha256 "ac0bfb7c2c38c4e31e56b84fb556aaea0133f0fdba8b748f6bdaa92de98ca056"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.16.0/gitunia-0.16.0-linux-x64.tar.gz"
      sha256 "04c7a6a2485aac19ece0064d59efee93e09c26d2395c64f45c134500ef39ae9d"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.16.0/gitunia-0.16.0-linux-arm64.tar.gz"
      sha256 "06f4aac22e66899193ac5d8372df548293d3c248cd4ff5be4bfa05a3a1520c9e"
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
