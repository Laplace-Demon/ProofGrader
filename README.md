# ProofGrader

A natural formalized proof language along with its parser and checker.

## Build

You can build ProofGrader on Linux, Windows and macOS, provided you have the [Coq Proof Assistant](https://coq.inria.fr/download) installed. If you use Coq through the [VsCoq extension](https://github.com/coq-community/vscoq) for [Visual Studio Code](https://code.visualstudio.com/), make sure you have the version 0.3.9 (or slightly older) installed. We met some problems when using the latest VsCoq versions.

The tool version for our parser is:

flex: 2.6.4,
[optional] flexdll: 0.37-1,
bison (GNU Bison): 3.8.2,
gcc (GNU gcc): 11.4.0

Then run the following commands to build the system:

```
make # build the Coq verifier
cd proofParser
make # build the proof parser
```

If you want to use our theorem manager,

```
cd theoremParser
make
```

## Code Structure

* lib/ExplicitName.v: the naming system of verifier 
* lib/Lang.v: the formal definitions of proof language
* lib/Poly.v: the solver for polynomials
* lib/Elaborator.v: the elaborator for proof, which performs static analysis on and modify the proofs  
* lib/Theorems.v: the database for theorems
* lib/Checker.v: the solver manager system and checker for proof
* proofParser: the parser for proofs written in LaTex
* theoremParser: the parser for theorems stored in JSON format


## Demo

You can parse and verify the proof examples by yourself to gain an overview of ProofGrader.

```
proofParser/proofParser examples/example_name.md
# fill in the example_name by markdown file names in the examples folder to run the proof parser
# compute the check_result in the corresponding Coq file to verify your proof
```

You can configure the supported theorems by modifying `config/theorems.json`, the default output path will be `lib/TestTheorems.v`.

And you can also experiment with your own proof in `proofParser/mathProof.md`, though current support for mathematical/proof constructs is limited.
