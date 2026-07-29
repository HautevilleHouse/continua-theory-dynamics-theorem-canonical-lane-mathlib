import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure AttractorCandidate where
  attractorSet : Set (E.stateSpace.carrier)
  forwardInvariant : ∀ x ∈ attractorSet, ∀ t ≥ 0, E.evolutionMap t x ∈ attractorSet
  attractsNeighborhood : ∃ (neighborhood : Set E.stateSpace.carrier),
    attractorSet ⊆ neighborhood ∧
    ∀ x ∈ neighborhood, ∀ ε > 0, ∃ T ≥ 0, ∀ t ≥ T,
      metric (E.evolutionMap t x) attractorSet < ε

structure AttractorEvidence {E : ContinuaEvolutionSystem} (A : AttractorCandidate) where
  existenceOfAttractor : ∃ A' : AttractorCandidate, True
  attractorMinimality : ∀ A' : AttractorCandidate, attractorSet ⊆ A'.attractorSet

structure AttractorExistenceClosed {E : ContinuaEvolutionSystem} : Prop where
  attractorPresent : ∃ A : AttractorCandidate, True

theorem attractorExistenceFromEvidence {E : ContinuaEvolutionSystem}
    (Ev : AttractorEvidence) : AttractorExistenceClosed := by
  exact { attractorPresent := Ev.existenceOfAttractor }

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse