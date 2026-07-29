import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.LogicalLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure CompleteLattice (A : AdmissibleClass) extends LogicalLattice A where
  Sup : Set carrier → carrier
  Inf : Set carrier → carrier
  supIsUpperBound : ∀ (s : Set carrier) (x : carrier), x ∈ s → order x (Sup s)
  supLeastUpperBound : ∀ (s : Set carrier) (b : carrier), (∀ x ∈ s, order x b) → order (Sup s) b
  infIsLowerBound : ∀ (s : Set carrier) (x : carrier), x ∈ s → order (Inf s) x
  infGreatestLowerBound : ∀ (s : Set carrier) (b : carrier), (∀ x ∈ s, order b x) → order b (Inf s)
  supIsUpperBoundTerm : supIsUpperBound
  supLeastUpperBoundTerm : supLeastUpperBound
  infIsLowerBoundTerm : infIsLowerBound
  infGreatestLowerBoundTerm : infGreatestLowerBound

structure CompleteLatticeEvidence (L : CompleteLattice) extends LogicalLatticeEvidence L.toLogicalLattice where
  supIsUpperBoundClosed : L.supIsUpperBound
  supLeastUpperBoundClosed : L.supLeastUpperBound
  infIsLowerBoundClosed : L.infIsLowerBound
  infGreatestLowerBoundClosed : L.infGreatestLowerBound

def CompleteLatticeClosed (L : CompleteLattice) : Prop :=
  LogicalLatticeClosed L.toLogicalLattice ∧
  L.supIsUpperBound ∧ L.supLeastUpperBound ∧ L.infIsLowerBound ∧ L.infGreatestLowerBound

theorem complete_lattice_closed_from_evidence (L : CompleteLattice) (E : CompleteLatticeEvidence L) : CompleteLatticeClosed L := by
  refine And.intro (logical_lattice_closed_from_evidence L.toLogicalLattice E)
    (And.intro E.supIsUpperBoundClosed
      (And.intro E.supLeastUpperBoundClosed
        (And.intro E.infIsLowerBoundClosed E.infGreatestLowerBoundClosed)))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse