import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachLatticesLemmaCanonicalLaneLean.BanachLatticeStructure

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure OrderContinuous (X Y : BanachLattice) (T : X.carrier → Y.carrier) where
  linear : LinearMap ℝ X.carrier Y.carrier
  orderContinuous : ∀ (x : ℕ → X.carrier), (∀ n, X.latticeOrder (x n) (x (n+1))) → (∃ sup, ∀ n, X.latticeOrder (x n) sup) → Y.latticeOrder (T (supremum)) (⨆ n, T (x n))
  normBound : ∃ C : ℝ, ∀ x : X.carrier, Y.norm (T x) ≤ C * X.norm x

structure OrderContinuousEvidence (X Y : BanachLattice) (T : OrderContinuous X Y) where
  orderContinuousClosed : T.orderContinuous
  normBoundClosed : T.normBound

def OrderContinuousClosed (X Y : BanachLattice) (T : OrderContinuous X Y) : Prop :=
  T.orderContinuous ∧ T.normBound

theorem order_continuous_closed_from_evidence (X Y : BanachLattice) (T : OrderContinuous X Y) (E : OrderContinuousEvidence X Y T) :
  OrderContinuousClosed X Y T :=
  And.intro E.orderContinuousClosed E.normBoundClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse