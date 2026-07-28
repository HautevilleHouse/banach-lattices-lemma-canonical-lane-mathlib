import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

structure BanachLatticeEmbeddingPackage (B1 B2 : BanachLatticeStruct) where
  embedding : B1.vectorSpace → B2.vectorSpace
  isometry : ∀ x : B1.vectorSpace, ∥embedding x∥ = ∥x∥
  orderEmbedding : ∀ x y : B1.vectorSpace, B1.partialOrder x y ↔ B2.partialOrder (embedding x) (embedding y)
  sublattice : Set (B2.vectorSpace)
  sublatticeClosed : ∀ x : B1.vectorSpace, embedding x ∈ sublattice
  sublatticeIso : SublatticeIsomorphicToB1 sublattice B1

structure BanachLatticeEmbeddingEvidence {B1 B2 : BanachLatticeStruct} (E : BanachLatticeEmbeddingPackage B1 B2) where
  isometryClosed : E.isometry
  orderEmbeddingClosed : E.orderEmbedding
  sublatticeClosed : E.sublatticeClosed

def BanachLatticeEmbeddingClosed {B1 B2 : BanachLatticeStruct} (E : BanachLatticeEmbeddingPackage B1 B2) : Prop :=
  E.isometry ∧ E.orderEmbedding ∧ E.sublatticeClosed

theorem banach_lattice_embedding_closed_from_evidence {B1 B2 : BanachLatticeStruct} (E : BanachLatticeEmbeddingPackage B1 B2) (Ev : BanachLatticeEmbeddingEvidence E) :
    BanachLatticeEmbeddingClosed E := by
  exact And.intro Ev.isometryClosed (And.intro Ev.orderEmbeddingClosed Ev.sublatticeClosed)

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse