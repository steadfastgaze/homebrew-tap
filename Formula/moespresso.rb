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
  include Language::Python::Virtualenv

  desc "Run large mixture-of-experts language models on Apple Silicon"
  homepage "https://github.com/steadfastgaze/MoEspresso"
  url "https://github.com/steadfastgaze/MoEspresso.git",
      tag:      "v1.0.0",
      revision: "0d9a4bae7db785eb42b5ccb51014f877da2822f2"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "cmake" => :build
  depends_on xcode: ["26.4.1", :build]
  depends_on arch: :arm64
  depends_on "libyaml"
  depends_on macos: :tahoe
  depends_on MoespressoMacOSRequirement
  depends_on "python@3.14"

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/1e/d3/26bf1008eb3d2daa8ef4cacc7f3bfdc11818d111f7e2d0201bc6e3b49d45/annotated_doc-0.0.4-py3-none-any.whl"
    sha256 "571ac1dc6991c450b25a9c2d84a3705e2ae7a53467b5d111c24fa8baabbed320"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/da/42/e921fccf5015463e32a3cf6ee7f980a6ed0f395ceeaa45060b61d86486c2/anyio-4.13.0-py3-none-any.whl"
    sha256 "08b310f9e24a9594186fd75b4f73f4a4152069e3853f1ed8bfbf58369f4ad708"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/59/8c/57e832b7af6d7c5abe66eb3fbe3a3a32f4d11ea23a1aa7131371035be991/certifi-2026.5.20-py3-none-any.whl"
    sha256 "3c52e209ba0a4ad7aebe60436a4ab349c39e1e602e8c134221e546902ad25897"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/c7/0d/67e5b4109ea4a837e80daa87c2c696711955e40449a97e8926672534def2/click-8.4.1-py3-none-any.whl"
    sha256 "482be17c6991b8c19c5429a1e995d9b0efdbb63172824c41f99965dc0ade8ec2"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/81/47/dd9a212ef6e343a6857485ffe25bba537304f1913bdbed446a23f7f592e1/filelock-3.29.0-py3-none-any.whl"
    sha256 "96f5f6344709aa1572bbf631c640e4ebeeb519e08da902c39a001882f30ac258"
  end

  resource "fsspec" do
    url "https://files.pythonhosted.org/packages/d5/0c/043d5e551459da400957a1395e0febbf771446ff34291afcbe3d8be2a279/fsspec-2026.4.0-py3-none-any.whl"
    sha256 "11ef7bb35dab8a394fde6e608221d5cf3e8499401c249bebaeaad760a1a8dec2"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "hatchling" do
    url "https://files.pythonhosted.org/packages/64/e2/2c0af0a52d16be74a4f194564fcdc417521ed863e9b65e4bc9052dacba6f/hatchling-1.31.0-py3-none-any.whl"
    sha256 "aac80bec8b6fe35e8480f1c335be8910fa210a0e6f735a139be205dadcacb544"
  end

  resource "hf-xet" do
    url "https://files.pythonhosted.org/packages/9b/ff/edcc2b40162bef3ff78e14ab637e5f3b89243d6aee72f5949d3bb6a5af83/hf_xet-1.5.0-cp37-abi3-macosx_11_0_arm64.whl"
    sha256 "fd6e5a9b0fdac4ed03ed45ef79254a655b1aaab514a02202617fbf643f5fdf7a"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "huggingface-hub" do
    url "https://files.pythonhosted.org/packages/02/28/d7cef5e477b855c25d415b8f57e5bc7347c7a90cad3acf1725d0c92ca294/huggingface_hub-1.17.0-py3-none-any.whl"
    sha256 "3b8156d23118e87f6a587648bfbc04f04a12a757ccb4ed298b35c4ae638bf24c"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/de/a7/f76514cc40ad6234098ecdebda08732d75964776c51a42845b7da10649e2/idna-3.17-py3-none-any.whl"
    sha256 "466e48829084efe2548012b855df21540b96f2e20e51bd124c851536556a592c"
  end

  resource "jang" do
    url "https://files.pythonhosted.org/packages/d0/4e/0d9d2b7c0e66e6a6cd5a33a2ee77056ffb2c60e3ec4ea06302a766ce904e/jang-2.5.29-py3-none-any.whl"
    sha256 "376bac1457448e43443e71ad146f3201d933c64e8a7a014537e406645471454c"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/62/a1/3d680cbfd5f4b8f15abc1d571870c5fc3e594bb582bc3b64ea099db13e56/jinja2-3.1.6-py3-none-any.whl"
    sha256 "85ece4451f492d0c13c5dd7c13a64681a86afae63a5f347908daf103ce6d2f67"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-4.2.0-py3-none-any.whl"
    sha256 "9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b5/64/7660f8a4a8e53c924d0fa05dc3a55c9cee10bbd82b11c5afb27d44b096ce/markupsafe-3.0.3-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "c47a551199eb8eb2121d4f0f15ae0f923d31350ab9280078d1e5f12b249e0026"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "mlx" do
    url "https://files.pythonhosted.org/packages/ef/5b/d364cc793bcb504621313acb55627cf0d5403ab2e0a594aa081cdbe4591f/mlx-0.31.2-cp314-cp314-macosx_26_0_arm64.whl"
    sha256 "59ccbd0f0044d4f97f11ebcbf0c480bc9e962935fd96275f120954afea65be8a"
  end

  resource "mlx-kquant" do
    url "https://github.com/steadfastgaze/mlx-kquant.git",
        revision: "e165cafafa149493d298871c610e29e95ffa8f10"
  end

  resource "mlx-lm" do
    url "https://files.pythonhosted.org/packages/90/02/9a67b8e4f87e3e2e5cd7b1ad79304b93c09a0db6af34bee75e6551c06c60/mlx_lm-0.31.3-py3-none-any.whl"
    sha256 "758cfddf1180053b7613db76fad3d246a331a2a905808e1164a275621fc983b8"
  end

  resource "mlx-metal" do
    url "https://files.pythonhosted.org/packages/99/82/11fd62a8d7a3e96e5c43220b17de0151e3f10101f8bb3b865f5bd9cdd074/mlx_metal-0.31.2-py3-none-macosx_26_0_arm64.whl"
    sha256 "84ffb60ee503f03eb684f5fb168d5cff31e2a16b7f27c1731eaf7662bd6e9b46"
  end

  resource "nanobind" do
    url "https://files.pythonhosted.org/packages/5a/bf/1a54e3573736f3ad15fc599c5dde007937234652a1a7efd62573b4ce3a7e/nanobind-2.12.0-py3-none-any.whl"
    sha256 "a10d3d88e691dcdf22696f9acd893fda3c5a05635763aea238829d274fcad480"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/60/61/23f27c172f022e04025b7dc2367f4d63c1a398120607ec896228649a6f48/numpy-2.4.6-cp314-cp314-macosx_14_0_arm64.whl"
    sha256 "d581b735e177fdcdce6fed8e7e8880a3fb6ee4e3653a3ac6af01c6f4c03effc5"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/b2/87e62e8c3e2f4b32e5fe99e0b86d576da1312593b39f47d8ceef365e95ed/packaging-26.2-py3-none-any.whl"
    sha256 "5fc45236b9446107ff2415ce77c807cee2862cb6fac22b8a73826d0693b0980e"
  end

  resource "pathspec" do
    url "https://files.pythonhosted.org/packages/f1/d9/7fb5aa316bc299258e68c73ba3bddbc499654a07f151cba08f6153988714/pathspec-1.1.1-py3-none-any.whl"
    sha256 "a00ce642f577bf7f473932318056212bc4f8bfdf53128c78bbd5af0b9b20b189"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/54/20/4d324d65cc6d9205fabedc306948156824eb9f0ee1633355a8f7ec5c66bf/pluggy-1.6.0-py3-none-any.whl"
    sha256 "e920276dd6813095e9377c0bc5566d94c932c33b27a3e3945d8389c374dd4746"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/83/ee/93d06e358a4aa32280b00e722d3ea0a1f25fc3cc5778d80581c9cca2c10e/protobuf-7.35.0-cp310-abi3-macosx_10_9_universal2.whl"
    sha256 "66be6c513931c794fa92c080ffee41671390da3d79da219cf9c0c0907f035dda"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/80/c4/f5af4c1ca8c1eeb2e92ccca14ce8effdeec651d5ab6053c589b074eda6e1/psutil-7.2.2-cp36-abi3-macosx_11_0_arm64.whl"
    sha256 "1a7b04c10f32cc88ab39cbf606e117fd74721c831c98a27dc04578deb0c16979"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/f4/7e/a72dd26f3b0f4f2bf1dd8923c85f7ceb43172af56d63c7383eb62b332364/pygments-2.20.0-py3-none-any.whl"
    sha256 "81a9e26dd42fd28a23a2d169d86d7ac03b46e2f8b59ed4698fb4785f946d0176"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/21/91/9d50b433828d8e74196904e168a43abf1e6e88b2a15d47ed742456720c37/regex-2026.5.9-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "2099f7e7ff7b6aa3192312650a56e91cc091e49d50b04e4f6f8b6e28b3b27f1c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-15.0.0-py3-none-any.whl"
    sha256 "33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb"
  end

  resource "safetensors" do
    url "https://files.pythonhosted.org/packages/e8/00/374c0c068e30cd31f1e1b46b4b5738168ec79e7689ca82ee93ddfea05109/safetensors-0.7.0-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "94fd4858284736bb67a897a41608b5b0c2496c9bdb3bf2af1fa3409127f20d57"
  end

  resource "sentencepiece" do
    url "https://files.pythonhosted.org/packages/ea/99/bbe054ebb5a5039457c590e0a4156ed073fb0fe9ce4f7523404dd5b37463/sentencepiece-0.2.1-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "c83b85ab2d6576607f31df77ff86f28182be4a8de6d175d2c33ca609925f5da1"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/e1/e3/c164c88b2e5ce7b24d667b9bd83589cf4f3520d97cad01534cd3c4f55fdb/setuptools-81.0.0-py3-none-any.whl"
    sha256 "fdd925d5c5d9f62e4b74b30d6dd7828ce236fd6ed998a08d81de62ce5a6310d6"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/e0/f9/0595336914c5619e5f28a1fb793285925a8cd4b432c9da0a987836c7f822/shellingham-1.5.4-py2.py3-none-any.whl"
    sha256 "7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686"
  end

  resource "tokenizers" do
    url "https://files.pythonhosted.org/packages/2e/47/174dca0502ef88b28f1c9e06b73ce33500eedfac7a7692108aec220464e7/tokenizers-0.22.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "1e418a55456beedca4621dbab65a318981467a2b188e982a23e117f115ce5001"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/16/e1/3079a9ff9b8e11b846c6ac5c8b5bfb7ff225eee721825310c91b3b50304f/tqdm-4.67.3-py3-none-any.whl"
    sha256 "ee1e4c0e59148062281c49d80b25b67771a127c85fc9676d3be5f243206826bf"
  end

  resource "transformers" do
    url "https://files.pythonhosted.org/packages/02/ca/2eaa5359f2ccb8c2e1656bc26305ad0cf438aa392ce4b29ae67a315c186e/transformers-5.9.0-py3-none-any.whl"
    sha256 "1d19509bcff7028ebc6b277d71caa712e8353778463d38764237d14b42b52788"
  end

  resource "trove-classifiers" do
    url "https://files.pythonhosted.org/packages/7c/a4/81502f486f01db95bc8320646a8a12511f5e556cb63d5e224d91816605c4/trove_classifiers-2026.6.1.19-py3-none-any.whl"
    sha256 "ab4c4ec93cc4a4e7815fa759906e05e6bb3f2fbd92ea0f897288c6a43efd15b3"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/3f/f9/2b3ff4e56e5fa7debfaf9eb135d0da96f3e9a1d5b27222223c7296336e5f/typer-0.25.1-py3-none-any.whl"
    sha256 "75caa44ed46a03fb2dab8808753ffacdbfea88495e74c85a28c5eefcf5f39c89"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/18/67/36e9267722cc04a6b9f15c7f3441c2363321a3ea07da7ae0c0707beb2a9c/typing_extensions-4.15.0-py3-none-any.whl"
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
  end

  def install
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "26.2"

    venv = virtualenv_create(libexec, "python3.14", system_site_packages: false)
    build_resources = %w[hatchling nanobind packaging pathspec pluggy setuptools trove-classifiers]
    build_resources.each do |name|
      venv.pip_install resource(name).cached_download
    end

    resources.each do |resource|
      next if resource.name == "mlx-kquant" || build_resources.include?(resource.name)

      venv.pip_install resource.cached_download, build_isolation: false
    end

    resource("mlx-kquant").stage do
      venv.pip_install Pathname.pwd, build_isolation: false
    end

    venv.pip_install_and_link buildpath, build_isolation: false

    gate_build = buildpath/"native/gate/build-homebrew"
    system "cmake", "-S", "native/gate", "-B", gate_build,
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_OSX_DEPLOYMENT_TARGET=26.2",
                    "-DPython_EXECUTABLE=#{libexec}/bin/python"
    system "cmake", "--build", gate_build, "--parallel", ENV.make_jobs

    gate = Dir[gate_build/"_moespresso_gate*.so"].first
    odie "native gate build produced no extension" if gate.nil?

    native_dir = libexec/"native"
    native_dir.install gate

    bin.children.each do |script|
      target = script.realpath
      script.unlink
      script.write_env_script target, MOESPRESSO_NATIVE_DIR: native_dir
    end
  end

  test do
    assert_match "usage:", shell_output("#{bin}/moespresso-generate --help")

    system libexec/"bin/python", "-c", "import mlx_kquant as kq; assert kq.metallib_loads()"

    ENV["MOESPRESSO_NATIVE_DIR"] = libexec/"native"
    system libexec/"bin/python", "-c",
           "from moespresso.runtime.native_gate import load_gate; assert load_gate() is not None"
  end
end
