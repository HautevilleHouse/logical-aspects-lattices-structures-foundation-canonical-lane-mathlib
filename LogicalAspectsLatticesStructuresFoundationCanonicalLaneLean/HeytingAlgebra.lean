import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.DistributiveLaw

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure HeytingAlgebra (A : AdmissibleClass) extends DistributiveLattice A where
  implies : carrier → carrier → carrier
  impliesProperties : ∀ x y z : carrier, order (meet x (implies x y)) (meet y y)  -- placeholder, need proper adjunction
  bottom : carrier
  bottomBound : ∀ x : carrier, order bottom x
  impliesPropertiesTerm : impliesProperties
  bottomBoundTerm : bottomBound

structure HeytingAlgebraEvidence (H : HeytingAlgebra) extends DistributiveLatticeEvidence H.toDistributiveLattice where
  impliesPropertiesClosed : H.impliesProperties
  bottomBoundClosed : H.bottomBound

def HeytingAlgebraClosed (H : HeytingAlgebra) : Prop :=
  DistributiveLatticeClosed H.toDistributiveLattice ∧ H.impliesProperties ∧ H.bottomBound

theorem heyting_algebra_closed_from_evidence (H : HeytingAlgebra) (E : HeytingAlgebraEvidence H) : HeytingAlgebraClosed H := by
  exact And.intro (distributive_lattice_closed_from_evidence H.toDistributiveLattice E)
    (And.intro E.impliesPropertiesClosed E.bottomBoundClosed)

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse