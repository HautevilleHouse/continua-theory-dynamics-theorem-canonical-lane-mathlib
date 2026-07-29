import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaTheoryDynamics

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse