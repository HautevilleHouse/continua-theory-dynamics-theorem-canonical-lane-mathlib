import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaCurvature

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaPDEPackage (G : ContinuaCurvaturePackage) where
  timeParameter : Type u
  fieldAt : timeParameter → Type v
  initialFieldMatches : Prop
  differentiableFieldFamily : Prop
  evolutionEquation : Prop
  maximalTimeInterval : Prop

structure ContinuaPDEEvidence {G : ContinuaCurvaturePackage}
    (F : ContinuaPDEPackage G) where
  initialFieldMatchesClosed : F.initialFieldMatches
  differentiableFieldFamilyClosed : F.differentiableFieldFamily
  evolutionEquationClosed : F.evolutionEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def ContinuaPDEClosed {G : ContinuaCurvaturePackage}
    (F : ContinuaPDEPackage G) : Prop :=
  F.initialFieldMatches ∧ F.differentiableFieldFamily ∧ F.evolutionEquation ∧ F.maximalTimeInterval

theorem continua_pde_closed_from_evidence
    {G : ContinuaCurvaturePackage} (F : ContinuaPDEPackage G)
    (E : ContinuaPDEEvidence F) : ContinuaPDEClosed F := by
  exact And.intro E.initialFieldMatchesClosed
    (And.intro E.differentiableFieldFamilyClosed
      (And.intro E.evolutionEquationClosed E.maximalTimeIntervalClosed))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse