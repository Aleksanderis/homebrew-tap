# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.1/gitunia-0.12.1-osx-arm64.tar.gz"
      sha256 "1c9832d22e5c0dd12b3090883b0632056c5b4855299300a2b75ec115d3073ea2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.1/gitunia-0.12.1-linux-x64.tar.gz"
      sha256 "bc50751704ad4ef26145b7191746be387df57bc9160a39515f2acb431120f237"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.12.1/gitunia-0.12.1-linux-arm64.tar.gz"
      sha256 "2ab2807b23f5e2d955ea26ee9d4eb45b0b6a709786622f8acbd331f9c09f3df5"
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
