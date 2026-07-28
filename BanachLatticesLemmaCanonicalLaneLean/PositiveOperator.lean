import BanachLatticesLemmaCanonicalLaneLean.BanachLattice

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure PositiveOperatorPackage (X Y : BanachLatticePackage) where
  linearMap : X.underlyingVectorLattice.carrier -> Y.underlyingVectorLattice.carrier
  positive : Prop
  bounded : Prop

structure PositiveOperatorEvidence {X Y : BanachLatticePackage}
    (T : PositiveOperatorPackage X Y) where
  positiveClosed : T.positive
  boundedClosed : T.bounded

def PositiveOperatorClosed {X Y : BanachLatticePackage}
    (T : PositiveOperatorPackage X Y) : Prop :=
  T.positive ∧ T.bounded

theorem positive_operator_closed_from_evidence
    {X Y : BanachLatticePackage} (T : PositiveOperatorPackage X Y)
    (E : PositiveOperatorEvidence T) : PositiveOperatorClosed T := by
  exact And.intro E.positiveClosed E.boundedClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse