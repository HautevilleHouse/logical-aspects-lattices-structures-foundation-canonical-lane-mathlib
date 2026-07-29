import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def latticeProjection : Projection LatticeEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem lattice_projection_idempotent (x : LatticeEndgameState) :
    latticeProjection.toFun (latticeProjection.toFun x) = latticeProjection.toFun x := by
  exact latticeProjection.idempotent x

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
