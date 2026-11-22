# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.13.0/gitunia-0.13.0-osx-arm64.tar.gz"
      sha256 "594afc2b52bedf987c4932c76a470a5e7249bc6ce1aaba284031a4bef8d0216a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.13.0/gitunia-0.13.0-linux-x64.tar.gz"
      sha256 "71241d2d0b7d54a06d2875ebad9cf495a59f62802c7c746ce4e9694c39b53ff9"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.13.0/gitunia-0.13.0-linux-arm64.tar.gz"
      sha256 "c42094d0ed4c81b8ad20c9d9a21196af096a46517cd783375b1cca73e46e5704"
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
