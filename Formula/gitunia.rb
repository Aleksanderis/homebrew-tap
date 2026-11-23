# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.14.0/gitunia-0.14.0-osx-arm64.tar.gz"
      sha256 "3362c134271272613ca9075c101e4d2f901a09d75e4f3f907a9151414f35d83a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.14.0/gitunia-0.14.0-linux-x64.tar.gz"
      sha256 "6017a5aca548fbda2591442ce00d6679e52cb459c47884aa0e3629df643c3efb"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.14.0/gitunia-0.14.0-linux-arm64.tar.gz"
      sha256 "d607c4a5e2aa7d6c3101122879a1a8edd0c72e63ae1729e16313a80f5ce6a8d9"
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
