import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LatticeSpace where
  carrier : Type
  partialOrder : PartialOrder carrier
  meets : carrier → carrier → carrier
  joins : carrier → carrier → carrier

structure LatticeAdmittedObject where
  space : LatticeSpace
  completeLatticeAxioms : Prop
  boundedLattice : Prop
  complemented : Prop
  atomic : Prop
  conclusion : completeLatticeAxioms ∧ boundedLattice ∧ complemented ∧ atomic

structure LatticeEndgameState where
  object : LatticeAdmittedObject

def LatticeWitnessClosed (O : LatticeAdmittedObject) : Prop :=
  O.conclusion

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
