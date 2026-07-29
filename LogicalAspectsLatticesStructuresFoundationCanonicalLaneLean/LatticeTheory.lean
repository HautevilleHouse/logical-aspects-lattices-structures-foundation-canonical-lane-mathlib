import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LatticeStructurePackage where
  poset : Type u
  meet : poset → poset → poset
  join : poset → poset → poset
  meetAssoc : ∀ x y z : poset, meet (meet x y) z = meet x (meet y z)
  joinAssoc : ∀ x y z : poset, join (join x y) z = join x (join y z)
  absorption : ∀ x y : poset, meet x (join x y) = x

structure LatticeEvidence (L : LatticeStructurePackage) where
  meetAssocClosed : L.meetAssoc
  joinAssocClosed : L.joinAssoc
  absorptionClosed : L.absorption

def LatticeClosed (L : LatticeStructurePackage) : Prop :=
  L.meetAssoc ∧ L.joinAssoc ∧ L.absorption

theorem lattice_closed_from_evidence (L : LatticeStructurePackage) (E : LatticeEvidence L) :
    LatticeClosed L := by
  exact And.intro E.meetAssocClosed (And.intro E.joinAssocClosed E.absorptionClosed)

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse