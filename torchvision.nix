{ buildPythonPackage
, fetchPypi
, pytorch
, numpy
, pillow
, lib
, fetchFromGitHub
, which
, libjpeg_turbo
, ninja
}:

buildPythonPackage rec {
  pname   = "torchvision";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "pytorch";
    repo = "vision";
    rev = "v${version}";
    sha256 = "0yhpbq7linrk2qp5jxsvlgkmwa5bn38s9kcswy4jzvmx1fjbkpq0";
  };

  doCheck = false;
  nativeBuildInputs = [ which ninja ];
  buildInputs = [ libjpeg_turbo ];
  propagatedBuildInputs = [ numpy pillow pytorch ];

  meta = {
    description = "PyTorch vision library";
    homepage    = "https://pytorch.org/";
    license     = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ericsagnes ];
  };
}
