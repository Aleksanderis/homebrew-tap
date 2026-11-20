# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.2/gitunia-0.12.2-osx-arm64.tar.gz"
      sha256 "3d9d26f064c5609ed235692d8f65a93d8b0fbc2e72fbe646ef119b80d600b3b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.2/gitunia-0.12.2-linux-x64.tar.gz"
      sha256 "36b5735c2f1e59b85596fbe7b68d2017e7242aed979dbc8e7126353b66d72ac9"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.2/gitunia-0.12.2-linux-arm64.tar.gz"
      sha256 "87182de3bef965c776eadb1c87886392dac625038b20a3c45a25d47eb4ee6213"
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
