import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeAdmissibleClass where
  object : BanachLatticeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : BanachLatticeAdmissibleClass) : Prop :=
  BanachLatticeWitnessClosed A.object

theorem bridge_from_admissible_class (A : BanachLatticeAdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : BanachLatticeAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BanachLatticeAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedBanachLatticeClosure (A : BanachLatticeAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_banach_lattice_endgame (A : BanachLatticeAdmissibleClass) :
    ConstrainedBanachLatticeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse
