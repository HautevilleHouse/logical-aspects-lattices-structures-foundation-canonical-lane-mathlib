import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LatticeSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LatticeAdmittedObject where
  space : LatticeSpace
  latticeStructure : Prop
  meetsJoinsComplete : Prop
  logicalConsistency : Prop
  conclusion : logicalConsistency

structure LatticeEndgameState where
  object : LatticeAdmittedObject

def LatticeWitnessClosed (O : LatticeAdmittedObject) : Prop :=
  O.logicalConsistency

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse