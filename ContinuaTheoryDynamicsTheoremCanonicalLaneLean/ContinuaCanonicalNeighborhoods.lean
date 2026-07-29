import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaSingularityModels

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaCanonicalNeighborhoodsPackage {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} {N : ContinuaNoncollapsingPackage E}
    (Q : ContinuaSingularityModelsPackage N) where
  highEnergyRegionCovered : Prop
  neckCapDecomposition : Prop
  scaleCompatibility : Prop
  persistenceUnderFlow : Prop

structure ContinuaCanonicalNeighborhoodsEvidence {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} {N : ContinuaNoncollapsingPackage E}
    {Q : ContinuaSingularityModelsPackage N} (C : ContinuaCanonicalNeighborhoodsPackage Q) where
  highEnergyRegionCoveredClosed : C.highEnergyRegionCovered
  neckCapDecompositionClosed : C.neckCapDecomposition
  scaleCompatibilityClosed : C.scaleCompatibility
  persistenceUnderFlowClosed : C.persistenceUnderFlow

def ContinuaCanonicalNeighborhoodsClosed {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} {N : ContinuaNoncollapsingPackage E}
    {Q : ContinuaSingularityModelsPackage N} (C : ContinuaCanonicalNeighborhoodsPackage Q) : Prop :=
  C.highEnergyRegionCovered ∧ C.neckCapDecomposition ∧ C.scaleCompatibility ∧ C.persistenceUnderFlow

theorem continua_canonical_neighborhoods_closed_from_evidence
    {G : ContinuaCurvaturePackage} {F : ContinuaPDEPackage G}
    {S : ContinuaShortTimeExistencePackage F} {E : ContinuaEnergyFunctionalPackage S}
    {N : ContinuaNoncollapsingPackage E} {Q : ContinuaSingularityModelsPackage N}
    (C : ContinuaCanonicalNeighborhoodsPackage Q) (Ev : ContinuaCanonicalNeighborhoodsEvidence C) :
    ContinuaCanonicalNeighborhoodsClosed C := by
  exact And.intro Ev.highEnergyRegionCoveredClosed
    (And.intro Ev.neckCapDecompositionClosed
      (And.intro Ev.scaleCompatibilityClosed Ev.persistenceUnderFlowClosed))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse