import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure DynamicsStabilityPackage where
  lyapunovFunction : Type u
  equilibriumPoint : Type v
  stabilityCondition : Prop
  basinOfAttraction : Prop
  localAsymptoticStability : Prop

structure DynamicsStabilityEvidence (S : DynamicsStabilityPackage) where
  stabilityConditionClosed : S.stabilityCondition
  basinOfAttractionClosed : S.basinOfAttraction
  localAsymptoticStabilityClosed : S.localAsymptoticStability

def DynamicsStabilityClosed (S : DynamicsStabilityPackage) : Prop :=
  S.stabilityCondition ∧ S.basinOfAttraction ∧ S.localAsymptoticStability

theorem dynamics_stability_closed_from_evidence (S : DynamicsStabilityPackage) (E : DynamicsStabilityEvidence S) : DynamicsStabilityClosed S := by
  exact And.intro E.stabilityConditionClosed (And.intro E.basinOfAttractionClosed E.localAsymptoticStabilityClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse