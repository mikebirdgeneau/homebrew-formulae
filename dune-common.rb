require 'formula'

class DuneCommon < Formula
  homepage ''
  url 'http://www.dune-project.org/download/2.2.1/dune-common-2.2.1.tar.gz'
  sha1 '9a9888924daf029e48b01b174adeb1472daa827b'

  #depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on :fortran

  def install

    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
