# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.3/gitunia-0.11.3-osx-arm64.tar.gz"
      sha256 "3d2ac6d8a7c9774f223b2b43112a197bf2437e101813a2e548f76017f5175a1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.3/gitunia-0.11.3-linux-x64.tar.gz"
      sha256 "18ea641915b0a6d3d335fec3d6779bc1c00382fe2280914c93bc598996657004"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.3/gitunia-0.11.3-linux-arm64.tar.gz"
      sha256 "8ab2351fad98559bcf5aed075cc4d8be9a79206fc566ca1a68998cdc9fd15ab1"
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
