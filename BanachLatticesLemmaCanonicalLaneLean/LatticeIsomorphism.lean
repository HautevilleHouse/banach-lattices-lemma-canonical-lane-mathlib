import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure LatticeIsomorphismPackage (B1 B2 : BanachLatticeStruct) where
  bijection : B1.vectorSpace ≃ B2.vectorSpace
  preservesOrder : ∀ x y : B1.vectorSpace, B1.partialOrder x y ↔ B2.partialOrder (bijection x) (bijection y)
  preservesNorm : ∀ x : B1.vectorSpace, ∥bijection x∥ = ∥x∥
  preservesLatticeOps : ∀ x y : B1.vectorSpace, bijection (B1.latticeOps x y) = B2.latticeOps (bijection x) (bijection y)

structure LatticeIsomorphismEvidence {B1 B2 : BanachLatticeStruct} (L : LatticeIsomorphismPackage B1 B2) where
  preservesOrderClosed : L.preservesOrder
  preservesNormClosed : L.preservesNorm
  preservesLatticeOpsClosed : L.preservesLatticeOps

def LatticeIsomorphismClosed {B1 B2 : BanachLatticeStruct} (L : LatticeIsomorphismPackage B1 B2) : Prop :=
  L.preservesOrder ∧ L.preservesNorm ∧ L.preservesLatticeOps

theorem lattice_isomorphism_closed_from_evidence {B1 B2 : BanachLatticeStruct} (L : LatticeIsomorphismPackage B1 B2) (E : LatticeIsomorphismEvidence L) :
    LatticeIsomorphismClosed L := by
  exact And.intro E.preservesOrderClosed (And.intro E.preservesNormClosed E.preservesLatticeOpsClosed)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse