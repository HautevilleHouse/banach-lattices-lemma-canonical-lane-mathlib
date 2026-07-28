namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure VectorLattice where
  carrier : Type u
  add : carrier -> carrier -> carrier
  smul : ℝ -> carrier -> carrier
  posCone : Set carrier
  latticeOp : carrier -> carrier -> carrier
  addCommSemigroup : AddCommSemigroup carrier
  addCommSemigroupProof : AddCommSemigroup carrier
  module : Module ℝ carrier
  moduleProof : Module ℝ carrier
  posConeClosed : Prop
  latticeOpCompatible : Prop

def VectorLatticeClosed (V : VectorLattice) : Prop :=
  V.posConeClosed ∧ V.latticeOpCompatible

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse