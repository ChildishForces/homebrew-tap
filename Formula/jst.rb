# Template for the jst Homebrew formula. The Release workflow renders this
# with the real version and per-target sha256 values and attaches the result
# (jst.rb) to the GitHub Release — copy that file into the tap repo as
# Formula/jst.rb.
class Jst < Formula
  desc "Convert JSON Schema to Zod, TypeScript, Pydantic, Swift, and Kotlin"
  homepage "https://github.com/ChildishForces/json-schema-transformer"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d74fffe5ee90cb4bf87da1754c7c269360cce4c6082729bac8580e4b70318956"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b3d209868a5cce52a86614240436e90eb641a4ec3273ae2b6a6d18e3fb8dea62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ee9baf2bdb667828cd299b14c84f8e6c9d9376050a1727aa905dc8e8255e16e"
    else
      url "https://github.com/ChildishForces/json-schema-transformer/releases/download/v#{version}/jst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37cc835d708e662dca3e7553c15b025881b800800aee6cf50175d7c8e9688b90"
    end
  end

  def install
    bin.install "jst"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jst --version")
  end
end
