import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeSpace where
  carrier : Type u
  norm : carrier → ℝ
  add : carrier → carrier → carrier
  zero : carrier
  smul : ℝ → carrier → carrier
  latticeJoin : carrier → carrier → carrier
  latticeMeet : carrier → carrier → carrier
  normedAddCommGroup : NormedAddCommGroup carrier
  latticeOrdered : Lattice carrier
  compatibility : ∀ a b : carrier, ‖a ∨ b‖ ≤ ‖a‖ ∨ ‖b‖

structure BanachLatticeAdmittedObject where
  space : BanachLatticeSpace
  orderContinuousNorm : Prop
  disjointSequenceProperty : Prop
  conclusion : orderContinuousNorm ∧ disjointSequenceProperty

def BanachLatticeWitnessClosed (O : BanachLatticeAdmittedObject) : Prop :=
  O.conclusion

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse
