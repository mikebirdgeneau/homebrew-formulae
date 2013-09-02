require 'formula'

class DuneGeometry < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-geometry-2.2.1.tar.gz'
  sha1 'f1f8b77a4c062d8662b8f4c44a378073568e1c87'

  depends_on :fortran
  depends_on 'dune-common'

  def install

    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true"
  end
end
