import HautevilleHouse.BanachLatticesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BanachLatticesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BanachLatticesLemmaCanonicalLaneLean
end HautevilleHouse