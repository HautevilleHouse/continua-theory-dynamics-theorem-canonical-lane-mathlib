import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaCurvaturePackage where
  configurationSpace : Type u
  topology : TopologicalSpace configurationSpace
  metric : Type v
  curvatureForm : Type w
  torsionField : Type x
  geodesicSpray : Type y
  smoothManifold : Prop
  metricSmooth : Prop
  curvatureFormClosed : Prop
  torsionFieldParallel : Prop
  geodesicSprayCompatible : Prop

structure ContinuaCurvatureEvidence (G : ContinuaCurvaturePackage) where
  smoothManifoldClosed : G.smoothManifold
  metricSmoothClosed : G.metricSmooth
  curvatureFormClosedClosed : G.curvatureFormClosed
  torsionFieldParallelClosed : G.torsionFieldParallel
  geodesicSprayCompatibleClosed : G.geodesicSprayCompatible

def ContinuaCurvatureClosed (G : ContinuaCurvaturePackage) : Prop :=
  G.smoothManifold ∧ G.metricSmooth ∧ G.curvatureFormClosed ∧ G.torsionFieldParallel ∧ G.geodesicSprayCompatible

theorem continua_curvature_closed_from_evidence
    (G : ContinuaCurvaturePackage) (E : ContinuaCurvatureEvidence G) :
    ContinuaCurvatureClosed G := by
  exact And.intro E.smoothManifoldClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.curvatureFormClosedClosed
        (And.intro E.torsionFieldParallelClosed E.geodesicSprayCompatibleClosed)))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse