import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LatticeStructurePackage where
  carrier : Type u
  partialOrder : Prop
  meetOperation : carrier → carrier → carrier
  joinOperation : carrier → carrier → carrier
  meetAssociative : Prop
  joinAssociative : Prop
  meetCommutative : Prop
  joinCommutative : Prop
  absorptionLaws : Prop

structure LatticeStructureEvidence (L : LatticeStructurePackage) where
  partialOrderClosed : L.partialOrder
  meetAssociativeClosed : L.meetAssociative
  joinAssociativeClosed : L.joinAssociative
  meetCommutativeClosed : L.meetCommutative
  joinCommutativeClosed : L.joinCommutative
  absorptionLawsClosed : L.absorptionLaws

def LatticeStructureClosed (L : LatticeStructurePackage) : Prop :=
  L.partialOrder ∧ L.meetAssociative ∧ L.joinAssociative ∧
  L.meetCommutative ∧ L.joinCommutative ∧ L.absorptionLaws

theorem lattice_structure_closed_from_evidence (L : LatticeStructurePackage)
    (E : LatticeStructureEvidence L) : LatticeStructureClosed L := by
  exact And.intro E.partialOrderClosed
    (And.intro E.meetAssociativeClosed
      (And.intro E.joinAssociativeClosed
        (And.intro E.meetCommutativeClosed
          (And.intro E.joinCommutativeClosed E.absorptionLawsClosed))))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse