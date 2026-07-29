import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean

structure LogicalLattice (A : AdmissibleClass) where
  carrier : Type u
  order : carrier → carrier → Prop
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  orderReflexive : ∀ x : carrier, order x x
  orderTransitive : ∀ x y z : carrier, order x y → order y z → order x z
  orderAntisymmetric : ∀ x y : carrier, order x y → order y x → x = y
  joinCommutative : ∀ x y : carrier, join x y = join y x
  joinAssociative : ∀ x y z : carrier, join (join x y) z = join x (join y z)
  joinAbsorptive : ∀ x y : carrier, join x (meet x y) = x
  meetCommutative : ∀ x y : carrier, meet x y = meet y x
  meetAssociative : ∀ x y z : carrier, meet (meet x y) z = meet x (meet y z)
  meetAbsorptive : ∀ x y : carrier, meet x (join x y) = x
  orderReflexiveTerm : orderReflexive
  orderTransitiveTerm : orderTransitive
  orderAntisymmetricTerm : orderAntisymmetric
  joinCommutativeTerm : joinCommutative
  joinAssociativeTerm : joinAssociative
  joinAbsorptiveTerm : joinAbsorptive
  meetCommutativeTerm : meetCommutative
  meetAssociativeTerm : meetAssociative
  meetAbsorptiveTerm : meetAbsorptive

structure LogicalLatticeEvidence (L : LogicalLattice) where
  orderReflexiveClosed : L.orderReflexive
  orderTransitiveClosed : L.orderTransitive
  orderAntisymmetricClosed : L.orderAntisymmetric
  joinCommutativeClosed : L.joinCommutative
  joinAssociativeClosed : L.joinAssociative
  joinAbsorptiveClosed : L.joinAbsorptive
  meetCommutativeClosed : L.meetCommutative
  meetAssociativeClosed : L.meetAssociative
  meetAbsorptiveClosed : L.meetAbsorptive

def LogicalLatticeClosed (L : LogicalLattice) : Prop :=
  L.orderReflexive ∧ L.orderTransitive ∧ L.orderAntisymmetric ∧
  L.joinCommutative ∧ L.joinAssociative ∧ L.joinAbsorptive ∧
  L.meetCommutative ∧ L.meetAssociative ∧ L.meetAbsorptive

theorem logical_lattice_closed_from_evidence (L : LogicalLattice) (E : LogicalLatticeEvidence L) : LogicalLatticeClosed L := by
  exact And.intro E.orderReflexiveClosed
    (And.intro E.orderTransitiveClosed
      (And.intro E.orderAntisymmetricClosed
        (And.intro E.joinCommutativeClosed
          (And.intro E.joinAssociativeClosed
            (And.intro E.joinAbsorptiveClosed
              (And.intro E.meetCommutativeClosed
                (And.intro E.meetAssociativeClosed
                  E.meetAbsorptiveClosed)))))))

end LogicalAspectsLatticesStructuresFoundationCanonicalLaneLean
end HautevilleHouse