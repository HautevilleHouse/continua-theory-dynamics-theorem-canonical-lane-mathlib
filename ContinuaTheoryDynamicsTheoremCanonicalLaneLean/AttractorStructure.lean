import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaTheoryDynamics

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure AttractorPackage where
  attractorSet : Set (ContinuaTheoryObject)
  basin : Set (ContinuaTheoryObject)
  attractionProperty : Prop
  invarianceUnderFlow : Prop

structure AttractorEvidence (A : AttractorPackage) where
  attractionPropertyClosed : A.attractionProperty
  invarianceUnderFlowClosed : A.invarianceUnderFlow

def AttractorClosed (A : AttractorPackage) : Prop :=
  A.attractionProperty ∧ A.invarianceUnderFlow

theorem attractor_closed_from_evidence (A : AttractorPackage) (E : AttractorEvidence A) : AttractorClosed A :=
  And.intro E.attractionPropertyClosed E.invarianceUnderFlowClosed

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse