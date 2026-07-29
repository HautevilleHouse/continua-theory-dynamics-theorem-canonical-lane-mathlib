import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure LyapunovPackage {D : ContinuaDynamicsPackage} (Dynamics : D) where
  lyapunovFunctions : Type u
  monotonicDecrease : Prop
  attractionBasins : Prop
  equilibriumClassification : Prop

structure LyapunovEvidence {D : ContinuaDynamicsPackage} {Dynamics : D}
    (L : LyapunovPackage Dynamics) where
  monotonicDecreaseClosed : L.monotonicDecrease
  attractionBasinsClosed : L.attractionBasins
  equilibriumClassificationClosed : L.equilibriumClassification

def LyapunovClosed {D : ContinuaDynamicsPackage} {Dynamics : D}
    (L : LyapunovPackage Dynamics) : Prop :=
  L.monotonicDecrease ∧ L.attractionBasins ∧ L.equilibriumClassification

theorem lyapunov_closed_from_evidence {D : ContinuaDynamicsPackage}
    {Dynamics : D} (L : LyapunovPackage Dynamics)
    (E : LyapunovEvidence L) : LyapunovClosed L := by
  exact And.intro E.monotonicDecreaseClosed
    (And.intro E.attractionBasinsClosed E.equilibriumClassificationClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse