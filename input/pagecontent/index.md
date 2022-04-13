### Introduction

This implementation guide is a collection of draft FHIR-based electronic Clinical Quality Measures (eCQM) that conform to
the [FHIR Quality Measure IG](http://hl7.org/fhir/us/cqfmeasures)

> NOTE: The measures in this implementation guide are works in progress and should not be considered final specifications or recommendations for guidance. The examples will help guide and direct the process of finding conventions and usage patterns that meet the needs of the various stakeholders in the measure development community.

### Content

This implementation guides contains electronic Clinical Quality Measure (eCQM) specifications, published
as FHIR Measure and Library resources.

For a complete listing of the Measures in this IG, refer to the [Measures](measures.html) page.

### Mermaid sequence diagram test

```mermaid
sequenceDiagram
participant U as User/Browser
participant CF as ClinFHIR
participant DR as Data Repository
participant SS as Submission System
participant KR as Knowledge Repository
participant TS as Terminology Server
participant RS as Receiving System

    U->>CF:create Group
    CF->>DR:FHIR Group
    SS->>DR:Library/id/$evaluate()
    DR-->>SS:result of CQL expression
    Note right of SS: Use for ATR discovery query
    SS->>DR:ATR Discovery
    DR-->>SS:search results
    SS->>DR:get Group
    SS->>RS:$submit-data
    RS->>SS:$export
    SS-->>RS:link
    RS->>SS:poll
    SS-->>RS:reply
    RS->>SS:get ndjson
    SS-->>RS:ndjson
```
