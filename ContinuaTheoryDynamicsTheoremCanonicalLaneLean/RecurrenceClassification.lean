import canonicalLaneMathlib.AdmissibleClass
import ContinuaTheoryDynamicsTheoremCanonicalLaneLean.ContinuaTheoryDynamics

namespace HautevilleHouse
namespace ContinuaTheoryDynamicsTheoremCanonicalLaneLean

structure RecurrencePackage where
  recurrentPoints : Set (ContinuaTheoryObject)
  periodicOrbits : Prop
  almostPeriodic : Prop
  recurrenceClassification : Prop

structure RecurrenceEvidence (R : RecurrencePackage) where
  periodicOrbitsClosed : R.periodicOrbits
  almostPeriodicClosed : R.almostPeriodic
  recurrenceClassificationClosed : R.recurrenceClassification

def RecurrenceClosed (R : RecurrencePackage) : Prop :=
  R.periodicOrbits ∧ R.almostPeriodic ∧ R.recurrenceClassification

theorem recurrence_closed_from_evidence (R : RecurrencePackage) (E : RecurrenceEvidence R) : RecurrenceClosed R :=
  And.intro E.periodicOrbitsClosed (And.intro E.almostPeriodicClosed E.recurrenceClassificationClosed)

end ContinuaTheoryDynamicsTheoremCanonicalLaneLean
end HautevilleHouse