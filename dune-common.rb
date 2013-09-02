require 'formula'

class DuneGeometry < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-geometry-2.2.1.tar.gz'
  sha1 'f1f8b77a4c062d8662b8f4c44a378073568e1c87'

  depends_on :fortran
  depends_on 'mikebirdgeneau/formulae/dune-common'
  
end

class DuneCommon < Formula
  homepage ''
  url 'http://www.dune-project.org/download/2.2.1/dune-common-2.2.1.tar.gz'
  sha1 '9a9888924daf029e48b01b174adeb1472daa827b'

  #depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on :fortran

  def install

    DuneGeometry.new.brew {(buildpath/'dune-geometry').install.Dir['*']}

    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
