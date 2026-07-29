import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ContinuaDynamicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse
