require 'formula'

class OpmCore < Formula
  homepage 'http://www.opm-project.org/'
  url 'https://github.com/OPM/opm-core/archive/release/2013.03/final.tar.gz'
  sha1 '538d8a55ef9a20d2af024f2547721f07ea3232b6'
  version '2013.03'
  depends_on 'cmake' => :build
  depends_on 'doxygen'
  depends_on 'boost'
  #depends_on 'boost-build'

  def install
    # Note: Added --disable-lto to configure flags, per https://github.com/OPM/opm-core/issues/257
    system "./configure", "--disable-debug", "--disable-lto", "--disable-dependency-tracking", "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" 
  end

  test do
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test opm-core`.
    system "true"
  end
end
