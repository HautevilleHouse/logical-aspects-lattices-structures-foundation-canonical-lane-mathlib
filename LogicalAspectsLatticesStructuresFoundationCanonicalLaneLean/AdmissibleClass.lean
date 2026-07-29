import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : LatticeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LatticeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
