import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaTheoryDynamics

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∃ (O : ContinuaObject), ContinuaWitnessClosed O

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    sorry

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse