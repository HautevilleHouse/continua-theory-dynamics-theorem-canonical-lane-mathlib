import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure InertialManifold where
  manifold : Set (E.stateSpace.carrier)
  finiteDimensional : FiniteDimensional ℝ (Submodule.span ℝ manifold)
  exponentiallyAttracting : ∀ x, distance (E.evolutionMap t x) manifold → 0 as t → ∞
  containsGlobalAttractor : attractorSet ⊆ manifold

structure InertialManifoldEvidence {E : ContinuaEvolutionSystem} (M : InertialManifold) where
  exponentialRate : ℝ
  ratePositive : exponentialRate > 0
  rateInequality : ∀ x, ∃ C ≥ 0, ∀ t ≥ 0,
    distance (E.evolutionMap t x) M.manifold ≤ C * Real.exp (-exponentialRate * t)
  finiteDimensionalityProof : M.finiteDimensional
  containsAttractorProof : M.containsGlobalAttractor

structure InertialManifoldClosed {E : ContinuaEvolutionSystem} (M : InertialManifold) : Prop where
  exponentiallyAttracting : M.exponentiallyAttracting
  containsAttractor : M.containsGlobalAttractor
  finiteDimensional : M.finiteDimensional

theorem inertialManifoldClosedFromEvidence {E : ContinuaEvolutionSystem} {M : InertialManifold}
    (Ev : InertialManifoldEvidence M) : InertialManifoldClosed M := by
  exact {
    exponentiallyAttracting := Ev.rateInequality
    containsAttractor := Ev.containsAttractorProof
    finiteDimensional := Ev.finiteDimensionalityProof
  }

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse