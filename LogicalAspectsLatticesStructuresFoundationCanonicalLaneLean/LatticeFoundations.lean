import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LatticeAxiomPackage (A : AdmissibleClass) where
  meetsCommutative : Prop
  joinsCommutative : Prop
  meetsCommutativeTerm : meetsCommutative
  joinsCommutativeTerm : joinsCommutative

structure LatticeAxiomEvidence (A : AdmissibleClass) (P : LatticeAxiomPackage A) where
  meetsCommutativeClosed : P.meetsCommutative
  joinsCommutativeClosed : P.joinsCommutative

def LatticeAxiomClosed (A : AdmissibleClass) (P : LatticeAxiomPackage A) : Prop :=
  P.meetsCommutative ∧ P.joinsCommutative

theorem lattice_axiom_closed_from_evidence (A : AdmissibleClass) (P : LatticeAxiomPackage A) (E : LatticeAxiomEvidence A P) :
    LatticeAxiomClosed A P := by
  exact And.intro E.meetsCommutativeClosed E.joinsCommutativeClosed

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse