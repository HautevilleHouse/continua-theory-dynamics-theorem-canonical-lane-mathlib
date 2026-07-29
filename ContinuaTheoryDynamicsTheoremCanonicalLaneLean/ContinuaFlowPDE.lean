import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaFlowPDEPackage where
  timeParameter : Type u
  stateSpace : Type v
  flowMap : timeParameter → stateSpace → stateSpace
  initialValue : stateSpace
  flowEquation : Prop
  maximalTimeInterval : Prop

structure ContinuaFlowPDEEvidence (F : ContinuaFlowPDEPackage) where
  initialValueClosed : F.initialValue = F.flowMap 0 F.initialValue
  flowEquationClosed : F.flowEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def ContinuaFlowPDEClosed (F : ContinuaFlowPDEPackage) : Prop :=
  F.flowEquation ∧ F.maximalTimeInterval ∧ (F.initialValue = F.flowMap 0 F.initialValue)

theorem continua_flow_pde_closed_from_evidence (F : ContinuaFlowPDEPackage) (E : ContinuaFlowPDEEvidence F) : ContinuaFlowPDEClosed F := by
  exact And.intro E.flowEquationClosed (And.intro E.maximalTimeIntervalClosed E.initialValueClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse