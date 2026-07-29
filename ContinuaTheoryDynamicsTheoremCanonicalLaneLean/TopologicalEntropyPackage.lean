import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure TopologicalEntropyPackage {D : ContinuaDynamicsPackage} (Dynamics : D) where
  entropyValue : ℝ
  variationalPrincipleHolds : Prop
  symbolicExtensionExists : Prop
  pressureRelation : Prop

structure TopologicalEntropyEvidence {D : ContinuaDynamicsPackage} {Dynamics : D}
    (E : TopologicalEntropyPackage Dynamics) where
  variationalPrincipleHoldsClosed : E.variationalPrincipleHolds
  symbolicExtensionExistsClosed : E.symbolicExtensionExists
  pressureRelationClosed : E.pressureRelation

def TopologicalEntropyClosed {D : ContinuaDynamicsPackage} {Dynamics : D}
    (E : TopologicalEntropyPackage Dynamics) : Prop :=
  E.variationalPrincipleHolds ∧ E.symbolicExtensionExists ∧ E.pressureRelation

theorem topological_entropy_closed_from_evidence {D : ContinuaDynamicsPackage}
    {Dynamics : D} (E : TopologicalEntropyPackage Dynamics)
    (Ev : TopologicalEntropyEvidence E) : TopologicalEntropyClosed E := by
  exact And.intro Ev.variationalPrincipleHoldsClosed
    (And.intro Ev.symbolicExtensionExistsClosed Ev.pressureRelationClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse