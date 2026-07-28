import HautevilleHouse.BanachLatticesLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

def ConstrainedBanachLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_banach_lattice_endgame (A : AdmissibleClass) :
    ConstrainedBanachLatticeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse