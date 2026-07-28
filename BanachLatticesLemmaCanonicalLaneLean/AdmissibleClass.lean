import Mathlib.Analysis.NormedSpace.Banach
import Mathlib.Analysis.Normed.Order.Lattice

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeStructure where
  carrier : Type u
  norm : carrier → ℝ
  order : carrier → carrier → Prop
  normedAddCommGroup : NormedAddCommGroup carrier
  normedLattice : NormedLattice carrier
  banach : CompleteSpace carrier
  lattice : Lattice carrier

structure BanachLatticeAdmittedObject where
  lattice : BanachLatticeStructure
  lemmaStatement : Prop
  conclusion : lemmaStatement

structure AdmissibleClass where
  object : BanachLatticeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse