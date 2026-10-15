class MoespressoMacOSRequirement < Requirement
  fatal true

  satisfy(build_env: false) do
    OS.mac? && OS::Mac.full_version >= MacOSVersion.new("26.2")
  end

  def message
    "MoEspresso requires macOS 26.2 or later."
  end
end

class Moespresso < Formula
  desc "Run large mixture-of-experts language models on Apple Silicon"
  homepage "https://github.com/steadfastgaze/MoEspresso"
  url "https://github.com/steadfastgaze/MoEspresso.git",
      tag:      "v4.0.0",
      revision: "0ae4bbd8599c550944dfbe16023e4618b9f8ccf2"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "cargo-about" => :build
  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on MoespressoMacOSRequirement

  def fetch
    system "cargo", "fetch", "--locked"
  end

  def install
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "26.2"
    system "cargo", "install", *std_cargo_args
    system "cargo", "about", "generate", "--locked", "--offline", "--fail",
           "about.hbs", "--output-file", "DEPENDENCY-NOTICES.txt"
    (pkgshare/"licenses").install "LICENSE-MIT", "LICENSE-APACHE-2.0",
                                 "THIRD-PARTY-NOTICES", "DEPENDENCY-NOTICES.txt"

    rust = formula_opt_prefix("rust")
    rust_docs = rust/"share/doc/rustc"
    rust_library = rust/"lib/rustlib/src/rust/library"
    odie "Rust standard-library copyright report is missing" unless (rust_docs/"COPYRIGHT-library.html").file?
    odie "Rust compiler-builtins license is missing" unless (rust_library/"compiler-builtins/LICENSE.txt").file?

    rust_notices = pkgshare/"licenses/rust"
    rust_notices.install rust_docs/"COPYRIGHT-library.html", rust_docs/"licenses"
    rust_notices.install rust/"LICENSE-MIT", rust/"LICENSE-APACHE"
    rust_library.glob("**/{LICENSE*,COPYRIGHT*}").select(&:file?).each do |notice|
      relative = notice.relative_path_from(rust_library)
      (rust_notices/"library"/relative.dirname).install notice
    end
    (rust_notices/"toolchain.txt").write Utils.safe_popen_read("rustc", "--version", "--verbose")
  end

  test do
    assert_equal "moespresso #{version}", shell_output("#{bin}/moespresso --version").strip
    assert_match "Usage: moespresso", shell_output("#{bin}/moespresso --help")
    assert_match "--disk-cache-mode", shell_output("#{bin}/moespresso serve --help")
    assert_match "--prompt", shell_output("#{bin}/moespresso generate --help")
    assert_match "--compare-id", shell_output("#{bin}/moespresso speed --help")
    assert_equal ["moespresso"], bin.children.map { |path| path.basename.to_s }.sort
    assert_predicate pkgshare/"licenses/DEPENDENCY-NOTICES.txt", :file?
    assert_predicate pkgshare/"licenses/rust/COPYRIGHT-library.html", :file?
    assert_predicate pkgshare/"licenses/rust/library/compiler-builtins/LICENSE.txt", :file?
  end
end
