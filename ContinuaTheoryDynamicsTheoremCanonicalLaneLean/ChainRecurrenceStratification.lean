import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure ChainRecurrencePackage {D : ContinuaDynamicsPackage} (Dynamics : D) where
  chainRecurrentSet : Set D.stateSpace
  chainTransitiveComponents : Set (Set D.stateSpace)
  periodicityDetected : Prop
  aperiodicResidual : Prop

structure ChainRecurrenceEvidence {D : ContinuaDynamicsPackage} {Dynamics : D}
    (C : ChainRecurrencePackage Dynamics) where
  periodicityDetectedClosed : C.periodicityDetected
  aperiodicResidualClosed : C.aperiodicResidual

def ChainRecurrenceClosed {D : ContinuaDynamicsPackage} {Dynamics : D}
    (C : ChainRecurrencePackage Dynamics) : Prop :=
  C.periodicityDetected ∧ C.aperiodicResidual

theorem chain_recurrence_closed_from_evidence {D : ContinuaDynamicsPackage}
    {Dynamics : D} (C : ChainRecurrencePackage Dynamics)
    (E : ChainRecurrenceEvidence C) : ChainRecurrenceClosed C := by
  exact And.intro E.periodicityDetectedClosed E.aperiodicResidualClosed

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse