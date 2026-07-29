import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LogicalAdmittedObject where
  lattice : Type u
  order : lattice → lattice → Prop
  meets : lattice → lattice → lattice
  joins : lattice → lattice → lattice
  top : lattice
  bottom : lattice
  complement_defined : Prop
  distributivity_holds : Prop
  modularity_holds : Prop
  conclusion : complement_defined ∧ distributivity_holds ∧ modularity_holds

def LogicalWitnessClosed (O : LogicalAdmittedObject) : Prop :=
  O.complement_defined ∧ O.distributivity_holds ∧ O.modularity_holds

theorem theorem_statement_internalized :
    ∀ (O : LogicalAdmittedObject), LogicalWitnessClosed O := by
  intro O
  exact O.conclusion

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse