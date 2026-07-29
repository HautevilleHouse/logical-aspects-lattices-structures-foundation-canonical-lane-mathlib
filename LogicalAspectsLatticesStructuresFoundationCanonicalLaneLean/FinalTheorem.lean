import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

def ConstrainedLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lattice_endgame (A : AdmissibleClass) :
    ConstrainedLatticeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
