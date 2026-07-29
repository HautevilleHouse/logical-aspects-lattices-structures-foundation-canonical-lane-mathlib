import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.LatticeTheory

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure GaloisConnectionPackage (A B : LatticeStructurePackage) where
  f : A.poset → B.poset
  g : B.poset → A.poset
  adjunction : ∀ x : A.poset, ∀ y : B.poset, f x ≤ y ↔ x ≤ g y
  where
    _≤_ : A.poset → A.poset → Prop := λ p q => meet A p q = p
    _≤_ : B.poset → B.poset → Prop := λ p q => meet B p q = p

structure GaloisConnectionEvidence (A B : LatticeStructurePackage) (G : GaloisConnectionPackage A B) where
  adjunctionClosed : G.adjunction

def GaloisConnectionClosed (A B : LatticeStructurePackage) (G : GaloisConnectionPackage A B) : Prop :=
  G.adjunction

theorem galois_connection_closed_from_evidence
    (A B : LatticeStructurePackage) (G : GaloisConnectionPackage A B) (E : GaloisConnectionEvidence A B G) :
    GaloisConnectionClosed A B G := by
  exact E.adjunctionClosed

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse