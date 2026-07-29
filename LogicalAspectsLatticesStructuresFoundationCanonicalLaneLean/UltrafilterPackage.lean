import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.FilterStructure

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure UltrafilterPackage (L : LatticeAdmittedObject) where
  ultrafilterExists : Prop
  primeFilterProperty : Prop
  modularLatticeCompatibility : Prop
  zornExtension : Prop

structure UltrafilterEvidence {L : LatticeAdmittedObject}
    (U : UltrafilterPackage L) where
  ultrafilterExistsClosed : U.ultrafilterExists
  primeFilterPropertyClosed : U.primeFilterProperty
  modularLatticeCompatibilityClosed : U.modularLatticeCompatibility
  zornExtensionClosed : U.zornExtension

def UltrafilterClosed {L : LatticeAdmittedObject}
    (U : UltrafilterPackage L) : Prop :=
  U.ultrafilterExists ∧ U.primeFilterProperty ∧
  U.modularLatticeCompatibility ∧ U.zornExtension

theorem ultrafilter_closed_from_evidence
    {L : LatticeAdmittedObject} (U : UltrafilterPackage L)
    (E : UltrafilterEvidence U) : UltrafilterClosed U := by
  exact And.intro E.ultrafilterExistsClosed
    (And.intro E.primeFilterPropertyClosed
      (And.intro E.modularLatticeCompatibilityClosed E.zornExtensionClosed))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
