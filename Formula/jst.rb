# Template for the jst Homebrew formula. The Release workflow renders this
# with the real version and per-target sha256 values and attaches the result
# (jst.rb) to the GitHub Release — copy that file into the tap repo as
# Formula/jst.rb.
class Jst < Formula
  desc "Convert JSON Schema to Zod, TypeScript, Pydantic, Swift, and Kotlin"
  homepage "https://github.com/ChildishForces/json-schema-transformer"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "68d1c861046dfb37b7e136ea548b1ca913b93a129818cbbf5829d200281657a6"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cd8803eea3f1721c599778c51e7372cd18b771a79fbad5748a3844482a001fda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d58311447baca29154582d2787f894428cacdf766c03562a48535ca0f112494e"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fed67ee15fe47630474170ba548f6aad54baad672313c5fc899aee022728e18c"
    end
  end

  def install
    bin.install "jst"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jst --version")
  end
end
