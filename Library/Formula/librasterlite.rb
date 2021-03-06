require 'formula'

class Librasterlite < Formula
  homepage 'https://www.gaia-gis.it/fossil/librasterlite/index'
  url 'http://www.gaia-gis.it/gaia-sins/librasterlite-sources/librasterlite-1.1g.tar.gz'
  sha1 '87f0abab90600db64a7d468343163e760769f0c7'
  revision 1

  bottle do
    cellar :any
    sha1 "58f0c71f03acbc4a88f4b630f902a706abc71bf2" => :mavericks
    sha1 "882d5edb935c3b8814a4b1326a05fb95b9889955" => :mountain_lion
    sha1 "896a8abafc3004a00f95a0ae8e19ca9fed1e7c58" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "libpng"
  depends_on "libgeotiff"
  depends_on "libspatialite"

  def install
    # Ensure Homebrew SQLite libraries are found before the system SQLite
    sqlite = Formula["sqlite"]
    ENV.append 'LDFLAGS', "-L#{sqlite.opt_lib}"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
