class Krasnodar < Formula
  include Language::Python::Virtualenv

  desc "Putting your mac to sleep when you say Krasnodar"
  homepage "https://github.com/alagunto/homebrew-krasnodar/"
  url "https://github.com/alagunto/homebrew-krasnodar/archive/krasnodar-final.tar.gz"
  version "1.1.0"
  sha256 ""
  license "MIT"

  depends_on "python"
  depends_on "portaudio"
  depends_on "sox"
  depends_on "swig"

  resource "PyAudio" do
    url "https://files.pythonhosted.org/packages/ab/42/b4f04721c5c5bfc196ce156b3c768998ef8c0ae3654ed29ea5020c749a6b/PyAudio-0.2.11.tar.gz"
    sha256 "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
    prefix.install Dir["./*"]
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resource("PyAudio")
  end

  test do
    system "true"
  end
end
