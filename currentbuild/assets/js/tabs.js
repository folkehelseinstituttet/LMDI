/**
 * jQuery UI tabs initialization for FHIR IG
 * Compatible with FHIR IG Publisher generated HTML structure
 */

// Initialize jQuery UI tabs when document is ready
if (typeof jQuery !== 'undefined') {
  $(document).ready(function() {
    // Initialize all divs with id="tabs" using jQuery UI tabs
    if (typeof $.fn.tabs !== 'undefined') {
      $('#tabs').tabs();
    }
  });
}
