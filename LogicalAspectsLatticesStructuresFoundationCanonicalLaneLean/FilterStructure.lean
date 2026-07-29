import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.UltrafilterPackage

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure FilterStructurePackage {L : LatticeAdmittedObject}
    {F : UltrafilterPackage L} where
  genericFilterDefined : Prop
  principalFilterIncluded : Prop
  filterConvergenceCompatible : Prop
  topologyGeneratedByAsTopologicalSpace : Prop

structure FilterStructureEvidence {L : LatticeAdmittedObject}
    {F : UltrafilterPackage L} (FS : FilterStructurePackage F) where
  genericFilterDefinedClosed : FS.genericFilterDefined
  principalFilterIncludedClosed : FS.principalFilterIncluded
  filterConvergenceCompatibleClosed : FS.filterConvergenceCompatible
  topologyGeneratedByAsTopologicalSpaceClosed : FS.topologyGeneratedByAsTopologicalSpace

def FilterStructureClosed {L : LatticeAdmittedObject}
    {F : UltrafilterPackage L} (FS : FilterStructurePackage F) : Prop :=
  FS.genericFilterDefined ∧ FS.principalFilterIncluded ∧
  FS.filterConvergenceCompatible ∧ FS.topologyGeneratedByAsTopologicalSpace

theorem filter_structure_closed_from_evidence
    {L : LatticeAdmittedObject} {F : UltrafilterPackage L}
    (FS : FilterStructurePackage F) (E : FilterStructureEvidence FS) :
    FilterStructureClosed FS := by
  exact And.intro E.genericFilterDefinedClosed
    (And.intro E.principalFilterIncludedClosed
      (And.intro E.filterConvergenceCompatibleClosed E.topologyGeneratedByAsTopologicalSpaceClosed))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
