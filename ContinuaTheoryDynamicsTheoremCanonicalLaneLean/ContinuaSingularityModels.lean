import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaNoncollapsing

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaSingularityModelsPackage {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} (N : ContinuaNoncollapsingPackage E) where
  blowupSequenceExists : Prop
  ancientSolutionLimit : Prop
  kappaSolutionClassification : Prop
  neckOrCapModel : Prop

structure ContinuaSingularityModelsEvidence {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} {N : ContinuaNoncollapsingPackage E}
    (Q : ContinuaSingularityModelsPackage N) where
  blowupSequenceExistsClosed : Q.blowupSequenceExists
  ancientSolutionLimitClosed : Q.ancientSolutionLimit
  kappaSolutionClassificationClosed : Q.kappaSolutionClassification
  neckOrCapModelClosed : Q.neckOrCapModel

def ContinuaSingularityModelsClosed {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} {N : ContinuaNoncollapsingPackage E}
    (Q : ContinuaSingularityModelsPackage N) : Prop :=
  Q.blowupSequenceExists ∧ Q.ancientSolutionLimit ∧ Q.kappaSolutionClassification ∧ Q.neckOrCapModel

theorem continua_singularity_models_closed_from_evidence
    {G : ContinuaCurvaturePackage} {F : ContinuaPDEPackage G}
    {S : ContinuaShortTimeExistencePackage F} {E : ContinuaEnergyFunctionalPackage S}
    {N : ContinuaNoncollapsingPackage E} (Q : ContinuaSingularityModelsPackage N)
    (Ev : ContinuaSingularityModelsEvidence Q) : ContinuaSingularityModelsClosed Q := by
  exact And.intro Ev.blowupSequenceExistsClosed
    (And.intro Ev.ancientSolutionLimitClosed
      (And.intro Ev.kappaSolutionClassificationClosed Ev.neckOrCapModelClosed))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse