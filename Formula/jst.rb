# NOTE: placeholder checksums — this formula is not installable until the
# first tagged release of json-schema-transformer. After each release, replace
# this file with the rendered `jst.rb` asset attached to the GitHub Release.
class Jst < Formula
  desc "Convert JSON Schema to Zod, TypeScript, Pydantic, Swift, and Kotlin"
  homepage "https://github.com/ChildishForces/json-schema-transformer"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "jst"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jst --version")
  end
end
