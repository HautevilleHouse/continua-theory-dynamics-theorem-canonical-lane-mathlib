import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ErgodicTheoryPackage where
  invariantMeasure : Type u
  ergodicTheorem : Prop
  mixingCondition : Prop
  entropy : Type v

structure ErgodicTheoryEvidence (E : ErgodicTheoryPackage) where
  ergodicTheoremClosed : E.ergodicTheorem
  mixingConditionClosed : E.mixingCondition

def ErgodicTheoryClosed (E : ErgodicTheoryPackage) : Prop :=
  E.ergodicTheorem ∧ E.mixingCondition

theorem ergodic_theory_closed_from_evidence (E : ErgodicTheoryPackage) (Ev : ErgodicTheoryEvidence E) : ErgodicTheoryClosed E := by
  exact And.intro Ev.ergodicTheoremClosed Ev.mixingConditionClosed

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse