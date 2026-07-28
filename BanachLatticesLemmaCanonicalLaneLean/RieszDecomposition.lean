import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure RieszDecompositionPackage where
  decomposableElement : Type u
  decompositionProperty : ∀ (x : decomposableElement), ∃ (a b : decomposableElement), a ∧ b = 0 ∧ x = a + b
  positivePart : decomposableElement → decomposableElement
  negativePart : decomposableElement → decomposableElement

structure RieszDecompositionEvidence (R : RieszDecompositionPackage) where
  decompositionPropertyClosed : R.decompositionProperty
  positivePartClosed : ∀ x : R.decomposableElement, R.positivePart x = sup x 0
  negativePartClosed : ∀ x : R.decomposableElement, R.negativePart x = sup (-x) 0

def RieszDecompositionClosed (R : RieszDecompositionPackage) : Prop :=
  R.decompositionProperty ∧ (∀ x : R.decomposableElement, R.positivePart x = sup x 0) ∧ (∀ x : R.decomposableElement, R.negativePart x = sup (-x) 0)

theorem riesz_decomposition_closed_from_evidence (R : RieszDecompositionPackage) (E : RieszDecompositionEvidence R) :
    RieszDecompositionClosed R := by
  exact And.intro E.decompositionPropertyClosed (And.intro E.positivePartClosed E.negativePartClosed)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse