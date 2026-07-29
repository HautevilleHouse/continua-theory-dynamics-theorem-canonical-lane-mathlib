import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaDynamicsPackage where
  stateSpace : Type u
  flowMap : stateSpace → stateSpace → stateSpace
  continuity : Prop
  groupAction : Prop
  invariantMeasures : Prop

structure ContinuaDynamicsEvidence (D : ContinuaDynamicsPackage) where
  continuityClosed : D.continuity
  groupActionClosed : D.groupAction
  invariantMeasuresClosed : D.invariantMeasures

def ContinuaDynamicsClosed (D : ContinuaDynamicsPackage) : Prop :=
  D.continuity ∧ D.groupAction ∧ D.invariantMeasures

theorem continua_dynamics_closed_from_evidence (D : ContinuaDynamicsPackage)
    (E : ContinuaDynamicsEvidence D) : ContinuaDynamicsClosed D := by
  exact And.intro E.continuityClosed (And.intro E.groupActionClosed E.invariantMeasuresClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse