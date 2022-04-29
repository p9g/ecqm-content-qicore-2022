library CMS1159FHIR version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers

parameter "Measurement Period" default Interval[DateTime(2012, 1, 1, 0, 0, 0, 0), DateTime(2013, 1, 1, 0, 0, 0, 0))

context Patient

define "Initial Population":
  exists "AnyEncounters"

define "AnyEncounters":
  ["Encounter"]

