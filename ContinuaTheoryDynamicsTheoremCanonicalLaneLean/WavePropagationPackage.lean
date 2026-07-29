import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure WavePropagationPackage {C : ContinuaConstitutivePackage} {D : DynamicsEvolutionPackage C} where
  waveSpeed : Type u
  acousticTensor : Type v
  waveFrontExistence : Prop
  shockFormation : Prop
  dispersionRelation : Prop

structure WavePropagationEvidence {C : ContinuaConstitutivePackage} {D : DynamicsEvolutionPackage C}
    (W : WavePropagationPackage C D) where
  waveFrontExistenceClosed : W.waveFrontExistence
  shockFormationClosed : W.shockFormation
  dispersionRelationClosed : W.dispersionRelation

def WavePropagationClosed {C : ContinuaConstitutivePackage} {D : DynamicsEvolutionPackage C}
    (W : WavePropagationPackage C D) : Prop :=
  W.waveFrontExistence ∧ W.shockFormation ∧ W.dispersionRelation

theorem wave_propagation_closed_from_evidence {C : ContinuaConstitutivePackage} {D : DynamicsEvolutionPackage C}
    (W : WavePropagationPackage C D) (E : WavePropagationEvidence W) : WavePropagationClosed W := by
  exact And.intro E.waveFrontExistenceClosed
    (And.intro E.shockFormationClosed E.dispersionRelationClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse