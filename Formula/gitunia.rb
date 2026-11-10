# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.9/gitunia-0.9-osx-arm64.tar.gz"
      sha256 "aea8bbe6d743e8080cff1cd183ff28c62345743a660439ef58562554f7a22ba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.9/gitunia-0.9-linux-x64.tar.gz"
      sha256 "3f48c9c8a23afbd2d596f1991ef6f80f084f9b2921210ee333d2d90cd3f86452"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.9/gitunia-0.9-linux-arm64.tar.gz"
      sha256 "3c16fae80328f7bf9d053ec99eb25e925c15cf74a88c9ded07ff5ff87472d05c"
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
