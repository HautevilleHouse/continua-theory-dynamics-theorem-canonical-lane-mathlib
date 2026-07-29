import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaConstitutivePackage where
  initialConfiguration : Type u
  deformationGradient : Type v
  stressTensor : Type w
  strainEnergy : Type x
  balanceLaws : Prop
  thermodynamicCompatibility : Prop
  frameIndifference : Prop
  materialSymmetry : Prop

structure ContinuaConstitutiveEvidence (C : ContinuaConstitutivePackage) where
  balanceLawsClosed : C.balanceLaws
  thermodynamicCompatibilityClosed : C.thermodynamicCompatibility
  frameIndifferenceClosed : C.frameIndifference
  materialSymmetryClosed : C.materialSymmetry

def ContinuaConstitutiveClosed (C : ContinuaConstitutivePackage) : Prop :=
  C.balanceLaws ∧ C.thermodynamicCompatibility ∧ C.frameIndifference ∧ C.materialSymmetry

theorem continua_constitutive_closed_from_evidence (C : ContinuaConstitutivePackage) (E : ContinuaConstitutiveEvidence C) :
    ContinuaConstitutiveClosed C := by
  exact And.intro E.balanceLawsClosed
    (And.intro E.thermodynamicCompatibilityClosed
      (And.intro E.frameIndifferenceClosed E.materialSymmetryClosed))

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse