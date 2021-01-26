{ buildPythonPackage
, fetchPypi
, matplotlib
, gensim
, pytorch
, pytest-runner
, torchvision
, numpy
, wordcloud
, callPackage
, fetchFromGitHub
}: 
buildPythonPackage rec {
  pname = "contextualized_topic_models";
  version = "1.8.1";
  src = fetchFromGitHub {
    owner = "MilaNLProc";
    repo = "contextualized-topic-models";
    rev = "v${version}";
    sha256 = "sha256-t6dmh6/cbZorn52sneYV48e4rdgdKabfLDjfQEBFMGY=";
  };

  postPatch = ''
    sed -i -e 's!==!>=!' requirements.txt
    sed -i -e 's!tqdm==.*!tqdm!' requirements.txt
  '';

  propagatedBuildInputs = [ 
    (callPackage ./sentence-transformers.nix {})
    numpy
    torchvision
    pytorch
    gensim
    wordcloud
    matplotlib
  ];

  buildInputs = [
    pytest-runner
  ];

  doCheck = false;
}
