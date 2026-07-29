import HautevilleHouse.LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LatticeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse
