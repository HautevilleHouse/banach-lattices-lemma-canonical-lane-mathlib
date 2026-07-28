import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure OrderContinuityCertificate (B : BanachLatticeSpace) where
  everyDisjointSequenceConvergesToZero : Prop
  everyOrderBoundedSequenceHasASubsequence : Prop
  everyOrderBoundedSequenceHasASubsequenceClosed : everyOrderBoundedSequenceHasASubsequence
  everyDisjointSequenceConvergesToZeroClosed : everyDisjointSequenceConvergesToZero

def OrderContinuityClosed (B : BanachLatticeSpace) (C : OrderContinuityCertificate B) : Prop :=
  C.everyDisjointSequenceConvergesToZero ∧ C.everyOrderBoundedSequenceHasASubsequence

theorem order_continuity_closed_from_evidence (B : BanachLatticeSpace) (C : OrderContinuityCertificate B) :
    OrderContinuityClosed B C := by
  exact And.intro C.everyDisjointSequenceConvergesToZeroClosed C.everyOrderBoundedSequenceHasASubsequenceClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse
