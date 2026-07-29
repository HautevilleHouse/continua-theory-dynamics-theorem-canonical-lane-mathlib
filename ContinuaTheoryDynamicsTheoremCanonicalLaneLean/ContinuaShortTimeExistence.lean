import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaPDE

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaShortTimeExistencePackage {G : ContinuaCurvaturePackage}
    (F : ContinuaPDEPackage G) where
  initialFieldRegular : Prop
  parabolicWellPosedness : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  smoothDependence : Prop

structure ContinuaShortTimeExistenceEvidence {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} (S : ContinuaShortTimeExistencePackage F) where
  initialFieldRegularClosed : S.initialFieldRegular
  parabolicWellPosednessClosed : S.parabolicWellPosedness
  localExistenceIntervalClosed : S.localExistenceInterval
  uniquenessOnOverlapClosed : S.uniquenessOnOverlap
  smoothDependenceClosed : S.smoothDependence

def ContinuaShortTimeExistenceClosed {G : ContinuaCurvaturePackage}
    {F : ContinuaPDEPackage G} (S : ContinuaShortTimeExistencePackage F) : Prop :=
  S.initialFieldRegular ∧ S.parabolicWellPosedness ∧ S.localExistenceInterval ∧
  S.uniquenessOnOverlap ∧ S.smoothDependence

theorem continua_short_time_existence_closed_from_evidence
    {G : ContinuaCurvaturePackage} {F : ContinuaPDEPackage G}
    (S : ContinuaShortTimeExistencePackage F) (E : ContinuaShortTimeExistenceEvidence S) :
    ContinuaShortTimeExistenceClosed S := by
  exact And.intro E.initialFieldRegularClosed
    (And.intro E.parabolicWellPosednessClosed
      (And.intro E.localExistenceIntervalClosed
        (And.intro E.uniquenessOnOverlapClosed E.smoothDependenceClosed)))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse