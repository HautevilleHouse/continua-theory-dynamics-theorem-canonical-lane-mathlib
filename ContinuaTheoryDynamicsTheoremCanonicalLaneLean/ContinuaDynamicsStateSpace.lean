import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaStateSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  metric : carrier → carrier → ℝ
  metricPositiveDefinite : ∀ x y, metric x y ≥ 0 ∧ (metric x y = 0 ↔ x = y)
  metricSymmetric : ∀ x y, metric x y = metric y x
  metricTriangleInequality : ∀ x y z, metric x z ≤ metric x y + metric y z

structure ContinuaEvolutionSystem where
  stateSpace : ContinuaStateSpace
  timeDomain : Set ℝ
  evolutionMap : ℝ → stateSpace.carrier → stateSpace.carrier
  initialCondition : ∀ x, evolutionMap 0 x = x
  semigroupProperty : ∀ t s x, evolutionMap (t + s) x = evolutionMap t (evolutionMap s x)
  continuity : ∀ x, ContinuousAt (λ t => evolutionMap t x) 0

def evolutionFamilyClosed (E : ContinuaEvolutionSystem) : Prop :=
  E.initialCondition ∧ E.semigroupProperty ∧ E.continuity

theorem evolutionFamilyClosedFromEvidence (E : ContinuaEvolutionSystem)
    (hInit : E.initialCondition) (hSemigroup : E.semigroupProperty)
    (hCont : E.continuity) : evolutionFamilyClosed E := by
  exact And.intro hInit (And.intro hSemigroup hCont)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse