class Clblas < Formula
  homepage "https://github.com/clMathLibraries/clBLAS"
  url "https://github.com/clMathLibraries/clBLAS/archive/v2.8.tar.gz"
  sha256 "66dd8454443e3257015f71f4bb13e614c5c27bea121eab4100dd851ac4641ce8"

  depends_on "cmake" => :build
  depends_on "boost" => :build

  def install
    args = std_cmake_args
    args << "-DBUILD_TEST=OFF"
    args << "-DBUILD_CLIENT=ON"
    args << "-DBUILD_KTEST=OFF"
    args << "-DSUFFIX_LIB:STRING="
    args << "-DCMAKE_MACOSX_RPATH:BOOL=ON"
    system "cmake", "src", *args
    system "make", "install"
  end

  test do
    system "#{bin}/client", "--cpu"
  end
end
