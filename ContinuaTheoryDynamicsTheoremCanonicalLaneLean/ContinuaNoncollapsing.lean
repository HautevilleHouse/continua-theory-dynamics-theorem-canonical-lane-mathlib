import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaEnergyFunctional

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaNoncollapsingPackage {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    (E : ContinuaEnergyFunctionalPackage S) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure ContinuaNoncollapsingEvidence {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} (N : ContinuaNoncollapsingPackage E) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def ContinuaNoncollapsingClosed {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} {S : ContinuaShortTimeExistencePackage F}
    {E : ContinuaEnergyFunctionalPackage S} (N : ContinuaNoncollapsingPackage E) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem continua_noncollapsing_closed_from_evidence
    {G : ContinuaCurvaturePackage} {F : ContinuaPDEPackage G}
    {S : ContinuaShortTimeExistencePackage F} {E : ContinuaEnergyFunctionalPackage S}
    (N : ContinuaNoncollapsingPackage E) (Ev : ContinuaNoncollapsingEvidence N) :
    ContinuaNoncollapsingClosed N := by
  exact And.intro Ev.scaleInvariantVolumeBoundClosed
    (And.intro Ev.curvatureScaleControlClosed Ev.blowupLimitNoncollapsedClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse