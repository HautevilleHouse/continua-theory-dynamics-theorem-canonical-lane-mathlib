import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaShortTimeExistence

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaEnergyFunctionalPackage {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} (S : ContinuaShortTimeExistencePackage F) where
  energyFunctional : Type u
  dissipationRate : Type v
  monotonicityFormula : Prop
  energyLowerBound : Prop
  gradientFlowInput : Prop

structure ContinuaEnergyFunctionalEvidence {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    (E : ContinuaEnergyFunctionalPackage S) where
  monotonicityFormulaClosed : E.monotonicityFormula
  energyLowerBoundClosed : E.energyLowerBound
  gradientFlowInputClosed : E.gradientFlowInput

def ContinuaEnergyFunctionalClosed {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    (E : ContinuaEnergyFunctionalPackage S) : Prop :=
  E.monotonicityFormula ∧ E.energyLowerBound ∧ E.gradientFlowInput

theorem continua_energy_functional_closed_from_evidence
    {G : ContinuaCurvaturePackage} {F : ContinuaPDEPackage G}
    {S : ContinuaShortTimeExistencePackage F} (E : ContinuaEnergyFunctionalPackage S)
    (Ev : ContinuaEnergyFunctionalEvidence E) : ContinuaEnergyFunctionalClosed E := by
  exact And.intro Ev.monotonicityFormulaClosed
    (And.intro Ev.energyLowerBoundClosed Ev.gradientFlowInputClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse