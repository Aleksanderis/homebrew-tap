# Template: scripts/homebrew-formula.sh fills the @...@ placeholders from a release (#945).
# Lives in the tap Aleksanderis/homebrew-tap as Formula/gitunia.rb; install with `brew install aleksanderis/tap/gitunia`.
class Gitunia < Formula
  desc "Keyboard-first terminal Git client (graph, branches, worktrees, vim-style keys)"
  homepage "https://github.com/Aleksanderis/Gitunia"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.10.0/gitunia-0.10.0-osx-arm64.tar.gz"
      sha256 "e0f7808abfe0ea1eb21222d40a40ecd50bd3f92197009ce8811c7ca1ee7c7018"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.10.0/gitunia-0.10.0-linux-x64.tar.gz"
      sha256 "fc17b9583f3536cddab95d4fe205ec1f234d6fe7ef1cd01a1fe1afaf16d4dd20"
    end
    on_arm do
      url "https://github.com/Aleksanderis/Gitunia/releases/download/v0.10.0/gitunia-0.10.0-linux-arm64.tar.gz"
      sha256 "030438fd8d6c842c528a2118ad80acf45e7a8933937aaa6cf8aee61d8c4c5527"
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
