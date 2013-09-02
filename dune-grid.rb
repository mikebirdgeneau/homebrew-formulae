require 'formula'

class DuneGrid < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-grid-2.2.1.tar.gz'
  sha1 '839988c39019e234d92be789ae083c5f510b8d41'

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
