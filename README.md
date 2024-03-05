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
make # build the Coq proof checker
cd proofParser
make # build the proof parser
```

## Code Structure

* examples: demo examples of ProofGrader
* lib/ExplicitName.v: naming system of the proof checker 
* lib/Lang.v: formal definition of the proof language
* lib/Poly.v: polynomial solver of the proof checker
* lib/Elaborator.v: static analyzer of the proof checker
* lib/Theorems.v: theorem database of the proof checker
* lib/Solver.v: solvers and the solver manager system of the proof checker 
* lib/Checker.v: the proof checker
* proofParser: the parser for natural language mathematical proofs written in LaTex

We also have a theoremParser that is able to parse theorems stored in JSON format into the theorem database. For now it has not been made full-fledged apart from some basic theorems, and the default output path is `lib/TestTheorems.v`.

## Proof Parser

You can parse a natural language mathematical proof by copying it into proofParser/testin.md and run the following command, proof steps should be separated by English commas ",".

```
cd proofParser
./proofParser
```

The resulting Coq file will be stored in proofParser/testin.v. Execute the Coq script and evaluate the expression "check_result" to check the result.

## Demo Examples

We provide a set of examples to show the capaity of ProofGrader and how its proof language is like. Examples are grouped together by their topic. You can parse and check the proof examples by yourself to gain a basic understanding. 