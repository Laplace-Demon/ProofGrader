lib/ExplicitName.vo lib/ExplicitName.glob lib/ExplicitName.v.beautified lib/ExplicitName.required_vo: lib/ExplicitName.v 
lib/ExplicitName.vio: lib/ExplicitName.v 
lib/ExplicitName.vos lib/ExplicitName.vok lib/ExplicitName.required_vos: lib/ExplicitName.v 
lib/Lang.vo lib/Lang.glob lib/Lang.v.beautified lib/Lang.required_vo: lib/Lang.v lib/ExplicitName.vo
lib/Lang.vio: lib/Lang.v lib/ExplicitName.vio
lib/Lang.vos lib/Lang.vok lib/Lang.required_vos: lib/Lang.v lib/ExplicitName.vos
lib/Theorems.vo lib/Theorems.glob lib/Theorems.v.beautified lib/Theorems.required_vo: lib/Theorems.v lib/ExplicitName.vo lib/Lang.vo
lib/Theorems.vio: lib/Theorems.v lib/ExplicitName.vio lib/Lang.vio
lib/Theorems.vos lib/Theorems.vok lib/Theorems.required_vos: lib/Theorems.v lib/ExplicitName.vos lib/Lang.vos
lib/Poly.vo lib/Poly.glob lib/Poly.v.beautified lib/Poly.required_vo: lib/Poly.v lib/Lang.vo lib/ExplicitName.vo
lib/Poly.vio: lib/Poly.v lib/Lang.vio lib/ExplicitName.vio
lib/Poly.vos lib/Poly.vok lib/Poly.required_vos: lib/Poly.v lib/Lang.vos lib/ExplicitName.vos
lib/Solver.vo lib/Solver.glob lib/Solver.v.beautified lib/Solver.required_vo: lib/Solver.v lib/Lang.vo lib/Poly.vo
lib/Solver.vio: lib/Solver.v lib/Lang.vio lib/Poly.vio
lib/Solver.vos lib/Solver.vok lib/Solver.required_vos: lib/Solver.v lib/Lang.vos lib/Poly.vos
lib/Elaborator.vo lib/Elaborator.glob lib/Elaborator.v.beautified lib/Elaborator.required_vo: lib/Elaborator.v lib/Lang.vo lib/Poly.vo
lib/Elaborator.vio: lib/Elaborator.v lib/Lang.vio lib/Poly.vio
lib/Elaborator.vos lib/Elaborator.vok lib/Elaborator.required_vos: lib/Elaborator.v lib/Lang.vos lib/Poly.vos
lib/Checker.vo lib/Checker.glob lib/Checker.v.beautified lib/Checker.required_vo: lib/Checker.v lib/Lang.vo lib/Theorems.vo lib/Poly.vo lib/Solver.vo
lib/Checker.vio: lib/Checker.v lib/Lang.vio lib/Theorems.vio lib/Poly.vio lib/Solver.vio
lib/Checker.vos lib/Checker.vok lib/Checker.required_vos: lib/Checker.v lib/Lang.vos lib/Theorems.vos lib/Poly.vos lib/Solver.vos
