import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachLatticesLemmaCanonicalLaneLean.BanachLatticeStructure

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure DualBanachLattice (X : BanachLattice) where
  dualCarrier : Type u
  dualNorm : dualCarrier → ℝ
  dualOrder : dualCarrier → dualCarrier → Prop
  dualVectorSpace : Module ℝ dualCarrier
  dualNormedLattice : Prop
  dualComplete : Prop
  isDualOf : BanachLattice
  dualityPairing : X.carrier → dualCarrier → ℝ

structure DualBanachLatticeEvidence (X : BanachLattice) (D : DualBanachLattice X) where
  dualNormedLatticeClosed : D.dualNormedLattice
  dualCompleteClosed : D.dualComplete
  pairingBilinear : BilinearMap ℝ X.carrier D.dualCarrier ℝ
  pairingPositive : ∀ (x : X.carrier) (f : D.dualCarrier), X.latticeOrder x 0 ∧ D.dualOrder f 0 → dualityPairing x f ≥ 0

def DualBanachLatticeClosed (X : BanachLattice) (D : DualBanachLattice X) : Prop :=
  D.dualNormedLattice ∧ D.dualComplete

theorem dual_banach_lattice_closed_from_evidence (X : BanachLattice) (D : DualBanachLattice X) (E : DualBanachLatticeEvidence X D) :
  DualBanachLatticeClosed X D :=
  And.intro E.dualNormedLatticeClosed E.dualCompleteClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse