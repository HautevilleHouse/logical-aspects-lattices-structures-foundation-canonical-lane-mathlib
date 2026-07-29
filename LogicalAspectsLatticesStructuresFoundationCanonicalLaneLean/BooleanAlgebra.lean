import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean.HeytingAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure BooleanAlgebra (A : AdmissibleClass) extends HeytingAlgebra A where
  complement : carrier → carrier
  complementProperties : ∀ x : carrier, join x (complement x) = bottom ∧ meet x (complement x) = bottom
  complementPropertiesTerm : complementProperties

structure BooleanAlgebraEvidence (B : BooleanAlgebra) extends HeytingAlgebraEvidence B.toHeytingAlgebra where
  complementPropertiesClosed : B.complementProperties

def BooleanAlgebraClosed (B : BooleanAlgebra) : Prop :=
  HeytingAlgebraClosed B.toHeytingAlgebra ∧ B.complementProperties

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebra) (E : BooleanAlgebraEvidence B) : BooleanAlgebraClosed B := by
  exact And.intro (heyting_algebra_closed_from_evidence B.toHeytingAlgebra E) E.complementPropertiesClosed

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse