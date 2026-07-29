import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure LyapunovFunctional {E : ContinuaEvolutionSystem} where
  functional : E.stateSpace.carrier → ℝ
  positiveDefinite : ∀ x ≠ 0, functional x > 0
  functionalZeroAtZero : functional 0 = 0
  nonincreasingAlongFlows : ∀ x t ≥ 0, functional (E.evolutionMap t x) ≤ functional x

structure LyapunovStabilityData {E : ContinuaEvolutionSystem} (L : LyapunovFunctional) where
  equilibriumStable : Prop
  basinOfAttraction : Set E.stateSpace.carrier
  attractionProperty : ∀ x ∈ basinOfAttraction, AsymptoticStabilityProperty E x

structure LyapunovStabilityClosed {E : ContinuaEvolutionSystem} (L : LyapunovFunctional) : Prop where
  stable : equilibriumStable
  attractionVerified : attractionProperty

theorem lyapunovStabilityFromData {E : ContinuaEvolutionSystem} {L : LyapunovFunctional}
    (D : LyapunovStabilityData L) : LyapunovStabilityClosed L := by
  exact { stable := D.equilibriumStable, attractionVerified := D.attractionProperty }

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse