import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLattice where
  carrier : Type u
  norm : carrier → ℝ
  latticeOrder : carrier → carrier → Prop
  vectorSpace : Module ℝ carrier
  normedLattice : Prop
  complete : Prop

structure BanachLatticeAdmissibleObject where
  lattice : BanachLattice
  orderClosed : Prop
  normClosed : Prop
  conclusion : orderClosed ∧ normClosed

structure AdmissibleClass where
  object : BanachLatticeAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse