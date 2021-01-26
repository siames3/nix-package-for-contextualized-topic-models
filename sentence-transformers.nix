{ lib
, buildPythonPackage
, fetchPypi
, transformers
, pytorch
, numpy
, scikitlearn
, scipy
, nltk
, sentencepiece
}:

buildPythonPackage rec {
  pname = "sentence-transformers";
  version = "0.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-QeQT8d0v0q//xK3HGI8/ng4WPqEt1zkf/ykEGwzG4PY=";
  };

  doCheck = false;

  propagatedBuildInputs = [
    transformers
    pytorch
    numpy
    scikitlearn
    scipy
    nltk
    sentencepiece
  ];


  meta = with lib; {
    description = "Sentence Embeddings using BERT / RoBERTa / XLM-R";
    homepage = https://github.com/UKPLab/sentence-transformers;
    license = licenses.asl20;
  };
}
