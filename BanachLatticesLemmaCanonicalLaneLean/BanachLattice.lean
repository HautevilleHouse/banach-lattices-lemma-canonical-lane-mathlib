import BanachLatticesLemmaCanonicalLaneLean.VectorLattice

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticePackage where
  underlyingVectorLattice : VectorLattice
  norm : underlyingVectorLattice.carrier -> ℝ
  normCompatible : Prop
  complete : Prop

structure BanachLatticeEvidence (B : BanachLatticePackage) where
  normCompatibleClosed : B.normCompatible
  completeClosed : B.complete

def BanachLatticeClosed (B : BanachLatticePackage) : Prop :=
  B.normCompatible ∧ B.complete

theorem banach_lattice_closed_from_evidence
    (B : BanachLatticePackage) (E : BanachLatticeEvidence B) :
    BanachLatticeClosed B := by
  exact And.intro E.normCompatibleClosed E.completeClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse