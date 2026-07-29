import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ContinuaTheoryObject where
  carrier : Type
  topology : TopologicalSpace carrier
  dynamics : carrier → carrier
  invariant : Set carrier
  denseOrbit : Prop
  minimalDynamics : Prop

structure ContinuaObject where
  object : ContinuaTheoryObject
  closureCondition : object.denseOrbit ∨ object.minimalDynamics

def ContinuaWitnessClosed (O : ContinuaObject) : Prop :=
  O.closureCondition

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse