import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeDual (B : BanachLatticeSpace) where
  dualSpace : Type u
  dualNorm : dualSpace → ℝ
  dualAdd : dualSpace → dualSpace → dualSpace
  dualZero : dualSpace
  dualSmul : ℝ → dualSpace → dualSpace
  dualLatticeJoin : dualSpace → dualSpace → dualSpace
  dualLatticeMeet : dualSpace → dualSpace → dualSpace
  dualNormedAddCommGroup : NormedAddCommGroup dualSpace
  dualLatticeOrdered : Lattice dualSpace
  dualCompatibility : ∀ f g : dualSpace, ‖f ∨ g‖ ≤ ‖f‖ ∨ ‖g‖
  isDual : BoundedLinearFunctional B.carrier ℝ ≃ dualSpace

structure DualSpaceEvidence {B : BanachLatticeSpace} (D : BanachLatticeDual B) where
  isDualClosed : D.isDual
  dualCompatibilityClosed : D.dualCompatibility

def DualSpaceClosed {B : BanachLatticeSpace} (D : BanachLatticeDual B) : Prop :=
  D.isDual ∧ D.dualCompatibility

theorem dual_space_closed_from_evidence {B : BanachLatticeSpace} (D : BanachLatticeDual B) (E : DualSpaceEvidence D) :
    DualSpaceClosed D := by
  exact And.intro E.isDualClosed E.dualCompatibilityClosed

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse
