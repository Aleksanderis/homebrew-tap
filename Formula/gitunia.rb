# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.8/gitunia-0.8-osx-arm64.tar.gz"
      sha256 "f78abeeb0a9ad9b2d5969ea294869f98be17413b44419ef9480b9be7d58f5f1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.8/gitunia-0.8-linux-x64.tar.gz"
      sha256 "eb4d7599c522b7e8ba236aae570f32978b9ed1b00ead4c8c3595b530dbc777c5"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.8/gitunia-0.8-linux-arm64.tar.gz"
      sha256 "c0bccfc2b1ad7d53457c4922fd0b92653fa7390978358fc973b42bf9352eae3d"
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
