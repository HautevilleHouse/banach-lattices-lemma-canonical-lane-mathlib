import BanachLatticesLemmaCanonicalLaneLean.BanachLattice

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeSpace where
  carrier : Type u
  norm : carrier -> ℝ
  add : carrier -> carrier -> carrier
  smul : ℝ -> carrier -> carrier
  posCone : Set carrier
  latticeOp : carrier -> carrier -> carrier
  normedAddCommGroup : NormedAddCommGroup carrier
  normedAddCommGroupProof : NormedAddCommGroup carrier
  module : Module ℝ carrier
  moduleProof : Module ℝ carrier
  posConeClosed : Prop
  latticeOpCompatible : Prop
  complete : Prop

structure BanachLatticeAdmittedObject where
  space : BanachLatticeSpace
  banachLatticeProperty : Prop
  conclusion : banachLatticeProperty

def BanachLatticeWitnessClosed (O : BanachLatticeAdmittedObject) : Prop :=
  O.banachLatticeProperty

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse