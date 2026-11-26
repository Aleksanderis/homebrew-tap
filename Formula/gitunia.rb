# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.15.0/gitunia-0.15.0-osx-arm64.tar.gz"
      sha256 "51214d4e1bbd8d3a08cf10adfe49df744e813c0d00e6f5aee8bf86d4846c73bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.15.0/gitunia-0.15.0-linux-x64.tar.gz"
      sha256 "9771fcd19c2ea82aaaaafa7a4b85b9c08e143466950b6ef365ec4acdf6eb336e"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.15.0/gitunia-0.15.0-linux-arm64.tar.gz"
      sha256 "5194b71cbf046b4d29b2fbba344f1da4c883e053192598d8edcfbfb5480c772c"
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
