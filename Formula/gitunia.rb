# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.0/gitunia-0.11.0-osx-arm64.tar.gz"
      sha256 "fe6c4e9aa834a46b362196dede3bea2f6ff8c045caebc1c6eb22f21aefb3267e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.0/gitunia-0.11.0-linux-x64.tar.gz"
      sha256 "929a13883af174cafdc04bc901ead0691eeaf05ea01df308f42552697be1c5eb"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.11.0/gitunia-0.11.0-linux-arm64.tar.gz"
      sha256 "5644697b5910fb822020a91f353dc8504b509d7dbfda82d3b9a3c250c0f2791d"
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
