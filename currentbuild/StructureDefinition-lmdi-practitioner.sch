<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile NoBasisPractitioner
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Practitioner</sch:title>
    <sch:rule context="f:Practitioner">
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:active) &lt;= 0">active: maximum cardinality of 'active' is 0</sch:assert>
      <sch:assert test="count(f:name) &lt;= 0">name: maximum cardinality of 'name' is 0</sch:assert>
      <sch:assert test="count(f:telecom) &lt;= 0">telecom: maximum cardinality of 'telecom' is 0</sch:assert>
      <sch:assert test="count(f:address) &lt;= 0">address: maximum cardinality of 'address' is 0</sch:assert>
      <sch:assert test="count(f:gender) &lt;= 0">gender: maximum cardinality of 'gender' is 0</sch:assert>
      <sch:assert test="count(f:birthDate) &lt;= 0">birthDate: maximum cardinality of 'birthDate' is 0</sch:assert>
      <sch:assert test="count(f:photo) &lt;= 0">photo: maximum cardinality of 'photo' is 0</sch:assert>
      <sch:assert test="count(f:qualification) &lt;= 0">qualification: maximum cardinality of 'qualification' is 0</sch:assert>
      <sch:assert test="count(f:communication) &lt;= 0">communication: maximum cardinality of 'communication' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
