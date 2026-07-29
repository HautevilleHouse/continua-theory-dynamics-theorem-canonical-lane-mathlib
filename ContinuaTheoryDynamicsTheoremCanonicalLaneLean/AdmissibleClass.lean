import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : ContinuaDynamicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ContinuaDynamicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse
