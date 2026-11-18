# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.0/gitunia-0.12.0-osx-arm64.tar.gz"
      sha256 "674487208e075caaee85a7f21938b2dc1fea6d896aba30b9e87f31b1a4cedb63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.0/gitunia-0.12.0-linux-x64.tar.gz"
      sha256 "bffb2fbf4aa8274cb63139ecf06dd4d13bf2dfecc0a2510f18d4fbee7563b7cb"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.0/gitunia-0.12.0-linux-arm64.tar.gz"
      sha256 "140f59ecbf012dfede8e9c7b187f012704b7df7b0791b0a1237b320d5662275e"
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
