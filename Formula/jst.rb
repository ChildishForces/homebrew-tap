# Template for the jst Homebrew formula. The Release workflow renders this
# with the real version and per-target sha256 values and attaches the result
# (jst.rb) to the GitHub Release — copy that file into the tap repo as
# Formula/jst.rb.
class Jst < Formula
  desc "Convert JSON Schema to Zod, TypeScript, Pydantic, Swift, and Kotlin"
  homepage "https://github.com/ChildishForces/json-schema-transformer"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "62f763fcf6061e6968c39b8b7d5317924f7c2d357e1fbc35916feac685939145"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b78d4ffc9ca31c8aa9f6c0981e20df2dfda86d2603b2e8d0f7d97455014152b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14984b7ee41efbd837b941f3ca70a14b9481797fcbe3b9d2df75c94cb39b8d11"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8accbfd1d6e0399ec37cf9a051d3c8b80b060e85c249e55e22a33c7cd7126d2"
    end
  end

  def install
    bin.install "jst"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jst --version")
  end
end
