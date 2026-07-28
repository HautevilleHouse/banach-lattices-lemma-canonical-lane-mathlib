import canonicalLaneMathlib.AdmissibleClass
import BanachLatticesLemmaCanonicalLaneLean.BanachLatticeStructure
import BanachLatticesLemmaCanonicalLaneLean.LatticeNormContinuity

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure RepresentationLemmaPackage {B : BanachLatticePackage} {L : LatticeNormContinuityPackage B} where
  representationSpace : Type u
  positiveFunctional : Type v
  rieszRepresentation : Prop
  extensionProperty : Prop

structure RepresentationLemmaEvidence {B : BanachLatticePackage} {L : LatticeNormContinuityPackage B} (R : RepresentationLemmaPackage B L) where
  rieszRepresentationClosed : R.rieszRepresentation
  extensionPropertyClosed : R.extensionProperty

def RepresentationLemmaClosed {B : BanachLatticePackage} {L : LatticeNormContinuityPackage B} (R : RepresentationLemmaPackage B L) : Prop :=
  R.rieszRepresentation ∧ R.extensionProperty

theorem representation_lemma_closed_from_evidence {B : BanachLatticePackage} {L : LatticeNormContinuityPackage B} (R : RepresentationLemmaPackage B L) (E : RepresentationLemmaEvidence R) : RepresentationLemmaClosed R := by
  exact And.intro E.rieszRepresentationClosed E.extensionPropertyClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse