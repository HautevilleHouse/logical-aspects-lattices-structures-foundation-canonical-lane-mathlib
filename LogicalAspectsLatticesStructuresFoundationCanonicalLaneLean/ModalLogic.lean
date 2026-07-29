import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.BooleanAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure ModalOperator (L : Type u) where
  box : L → L
  diamond : L → L

structure ModalLogicPackage (L : LatticeStructurePackage) (D : DistributiveLatticePackage L)
    (B : BooleanAlgebraPackage L D) where
  modalOp : ModalOperator L.carrier
  normalityBox : Prop
  normalityDiamond : Prop
  dualityLaw : Prop
  fixedPointLaws : Prop

structure ModalLogicEvidence {L : LatticeStructurePackage}
    {D : DistributiveLatticePackage L} {B : BooleanAlgebraPackage L D}
    (M : ModalLogicPackage L D B) where
  normalityBoxClosed : M.normalityBox
  normalityDiamondClosed : M.normalityDiamond
  dualityLawClosed : M.dualityLaw
  fixedPointLawsClosed : M.fixedPointLaws

def ModalLogicClosed {L : LatticeStructurePackage}
    {D : DistributiveLatticePackage L} {B : BooleanAlgebraPackage L D}
    (M : ModalLogicPackage L D B) : Prop :=
  M.normalityBox ∧ M.normalityDiamond ∧ M.dualityLaw ∧ M.fixedPointLaws

theorem modal_logic_closed_from_evidence {L : LatticeStructurePackage}
    {D : DistributiveLatticePackage L} {B : BooleanAlgebraPackage L D}
    (M : ModalLogicPackage L D B) (E : ModalLogicEvidence M) :
    ModalLogicClosed M := by
  exact And.intro E.normalityBoxClosed
    (And.intro E.normalityDiamondClosed
      (And.intro E.dualityLawClosed E.fixedPointLawsClosed))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse