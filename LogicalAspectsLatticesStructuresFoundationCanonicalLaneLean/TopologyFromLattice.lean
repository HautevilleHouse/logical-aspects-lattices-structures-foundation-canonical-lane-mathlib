import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.CompleteLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure TopologyFromLattice (A : AdmissibleClass) (L : CompleteLattice) where
  openSets : Set L.carrier
  openContainsBottom : L.Inf openSets ∈ openSets
  openClosedUnderSup : ∀ (s : Set L.carrier), s ⊆ openSets → L.Sup s ∈ openSets
  openClosedUnderFiniteInf : ∀ (x y : L.carrier), x ∈ openSets → y ∈ openSets → L.meet x y ∈ openSets
  openContainsBottomTerm : openContainsBottom
  openClosedUnderSupTerm : openClosedUnderSup
  openClosedUnderFiniteInfTerm : openClosedUnderFiniteInf

structure TopologyFromLatticeEvidence (T : TopologyFromLattice) where
  openContainsBottomClosed : T.openContainsBottom
  openClosedUnderSupClosed : T.openClosedUnderSup
  openClosedUnderFiniteInfClosed : T.openClosedUnderFiniteInf

def TopologyFromLatticeClosed (T : TopologyFromLattice) : Prop :=
  T.openContainsBottom ∧ T.openClosedUnderSup ∧ T.openClosedUnderFiniteInf

theorem topology_from_lattice_closed_from_evidence (T : TopologyFromLattice) (E : TopologyFromLatticeEvidence T) : TopologyFromLatticeClosed T := by
  exact And.intro E.openContainsBottomClosed
    (And.intro E.openClosedUnderSupClosed E.openClosedUnderFiniteInfClosed)

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse