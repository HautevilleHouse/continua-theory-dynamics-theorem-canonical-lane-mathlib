import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

def ConstrainedContinuaDynamicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continua_dynamics_endgame (A : AdmissibleClass) :
    ConstrainedContinuaDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse