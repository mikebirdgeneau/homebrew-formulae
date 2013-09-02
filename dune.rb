require 'formula'

class DuneIstl < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-istl-2.2.1.tar.gz'
  sha1 'e213d2daa5c5f330d397e7951544170151042f8d'

  depends_on :fortran
  depends_on 'mikebirdgeneau/formulae/dune-common'

end

class DuneGeometry < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-geometry-2.2.1.tar.gz'
  sha1 'f1f8b77a4c062d8662b8f4c44a378073568e1c87'

  depends_on :fortran
  depends_on 'mikebirdgeneau/formulae/dune-common'
  
end

#class OpmCore < Formula
#  homepage 'http://www.opm-project.org/'
#  url 'https://github.com/OPM/opm-core/archive/release/2013.03/final.tar.gz'
#  sha1 '538d8a55ef9a20d2af024f2547721f07ea3232b6'
#  version '2013.03'
#end

class DuneCommon < Formula
  homepage 'http://www.dune-project.org'
  url 'http://www.dune-project.org/download/2.2.1/dune-common-2.2.1.tar.gz'
  sha1 '9a9888924daf029e48b01b174adeb1472daa827b'

  depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on :fortran

  def install

    DuneGeometry.new.brew {(buildpath/'dune-geometry').install Dir['*'] }
    DuneIstl.new.brew {(buildpath/'dune-istl').install Dir['*'] }
    #OpmCore.new.brew {(buildpath/'opm-core').install Dir['*'] }
    system "#{buildpath}/bin/dunecontrol", "all","--only=dune-common", "--prefix=#{prefix}"   
    system "#{buildpath}/bin/dunecontrol", "all","--only=dune-grid", "--prefix=#{prefix}"   
    system "#{buildpath}/bin/dunecontrol", "all","--only=dune-istl", "--prefix=#{prefix}"   
    
    # system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "true"
  end
end
