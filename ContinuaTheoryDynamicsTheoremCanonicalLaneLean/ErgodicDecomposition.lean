import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ErgodicDecompositionPackage {D : ContinuaDynamicsPackage} (Dynamics : D) where
  ergodicComponents : Set (D.stateSpace → D.stateSpace)
  decompositionUnique : Prop
  ergodicTheoremApplies : Prop
  mixingProperties : Prop

structure ErgodicDecompositionEvidence {D : ContinuaDynamicsPackage} {Dynamics : D}
    (E : ErgodicDecompositionPackage Dynamics) where
  decompositionUniqueClosed : E.decompositionUnique
  ergodicTheoremAppliesClosed : E.ergodicTheoremApplies
  mixingPropertiesClosed : E.mixingProperties

def ErgodicDecompositionClosed {D : ContinuaDynamicsPackage} {Dynamics : D}
    (E : ErgodicDecompositionPackage Dynamics) : Prop :=
  E.decompositionUnique ∧ E.ergodicTheoremApplies ∧ E.mixingProperties

theorem ergodic_decomposition_closed_from_evidence {D : ContinuaDynamicsPackage}
    {Dynamics : D} (E : ErgodicDecompositionPackage Dynamics)
    (Ev : ErgodicDecompositionEvidence E) : ErgodicDecompositionClosed E := by
  exact And.intro Ev.decompositionUniqueClosed
    (And.intro Ev.ergodicTheoremAppliesClosed Ev.mixingPropertiesClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse