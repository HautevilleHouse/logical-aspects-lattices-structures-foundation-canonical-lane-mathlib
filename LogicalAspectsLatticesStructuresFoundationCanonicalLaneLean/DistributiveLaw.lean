import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.LogicalLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure DistributiveLattice (A : AdmissibleClass) extends LogicalLattice A where
  joinDistributes : ∀ x y z : carrier, join x (meet y z) = meet (join x y) (join x z)
  joinDistributesTerm : joinDistributes

structure DistributiveLatticeEvidence (L : DistributiveLattice) extends LogicalLatticeEvidence L.toLogicalLattice where
  joinDistributesClosed : L.joinDistributes

def DistributiveLatticeClosed (L : DistributiveLattice) : Prop :=
  LogicalLatticeClosed L.toLogicalLattice ∧ L.joinDistributes

theorem distributive_lattice_closed_from_evidence (L : DistributiveLattice) (E : DistributiveLatticeEvidence L) : DistributiveLatticeClosed L := by
  refine And.intro (logical_lattice_closed_from_evidence L.toLogicalLattice E) E.joinDistributesClosed

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse