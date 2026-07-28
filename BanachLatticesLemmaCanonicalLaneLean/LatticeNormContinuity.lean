import canonicalLaneMathlib.AdmissibleClass
import BanachLatticesLemmaCanonicalLaneLean.BanachLatticeStructure

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure LatticeNormContinuityPackage (B : BanachLatticePackage) where
  normLatticeCompatibility : Prop
  orderUnitNorm : Prop
  continuityOfLatticeOps : Prop

structure LatticeNormContinuityEvidence {B : BanachLatticePackage} (L : LatticeNormContinuityPackage B) where
  normLatticeCompatibilityClosed : L.normLatticeCompatibility
  orderUnitNormClosed : L.orderUnitNorm
  continuityOfLatticeOpsClosed : L.continuityOfLatticeOps

def LatticeNormContinuityClosed {B : BanachLatticePackage} (L : LatticeNormContinuityPackage B) : Prop :=
  L.normLatticeCompatibility ∧ L.orderUnitNorm ∧ L.continuityOfLatticeOps

theorem lattice_norm_continuity_closed_from_evidence {B : BanachLatticePackage} (L : LatticeNormContinuityPackage B) (E : LatticeNormContinuityEvidence L) : LatticeNormContinuityClosed L := by
  exact And.intro E.normLatticeCompatibilityClosed (And.intro E.orderUnitNormClosed E.continuityOfLatticeOpsClosed)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse