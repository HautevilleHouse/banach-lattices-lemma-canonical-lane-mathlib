import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure OrderContinuousDualPackage (B : BanachLatticeStruct) where
  dualSpace : Type u
  dualNormed : NormedAddCommGroup dualSpace
  dualOrder : PartialOrder dualSpace
  integration : B.vectorSpace → dualSpace
  orderContinuous : ∀ (f : dualSpace) (x : B.vectorSpace) (seq : ℕ → B.vectorSpace), (∀ n, B.partialOrder (seq n) (seq (n+1))) ∧ (∀ n, B.partialOrder (seq n) x) → f (sup_seq seq) = sup (f ∘ seq)
  normBound : ∀ f : dualSpace, ∥f∥ = sup (∏ x, |f x|) / ∥x∥

structure OrderContinuousDualEvidence (B : BanachLatticeStruct) (D : OrderContinuousDualPackage B) where
  orderContinuousClosed : D.orderContinuous
  normBoundClosed : D.normBound

def OrderContinuousDualClosed (B : BanachLatticeStruct) (D : OrderContinuousDualPackage B) : Prop :=
  D.orderContinuous ∧ D.normBound

theorem order_continuous_dual_closed_from_evidence (B : BanachLatticeStruct) (D : OrderContinuousDualPackage B) (E : OrderContinuousDualEvidence B D) :
    OrderContinuousDualClosed B D := by
  exact And.intro E.orderContinuousClosed E.normBoundClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse