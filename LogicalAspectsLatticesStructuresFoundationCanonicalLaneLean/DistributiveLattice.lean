import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.LatticeFoundations

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure DistributiveLatticePackage (A : AdmissibleClass) (P : LatticeAxiomPackage A) where
  distributivityLaw : Prop
  distributivityLawTerm : distributivityLaw

structure DistributiveLatticeEvidence (A : AdmissibleClass) (P : LatticeAxiomPackage A) (D : DistributiveLatticePackage A P) where
  distributivityLawClosed : D.distributivityLaw

def DistributiveLatticeClosed (A : AdmissibleClass) (P : LatticeAxiomPackage A) (D : DistributiveLatticePackage A P) : Prop :=
  D.distributivityLaw

theorem distributive_lattice_closed_from_evidence (A : AdmissibleClass) (P : LatticeAxiomPackage A) (D : DistributiveLatticePackage A P) (E : DistributiveLatticeEvidence A P D) :
    DistributiveLatticeClosed A P D := by
  exact E.distributivityLawClosed

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse