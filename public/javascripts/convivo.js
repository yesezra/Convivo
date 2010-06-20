$(document).ready(function() { 
  // Sort tables with class .tablesorter
  $(".tablesorter").tablesorter({sortList:[[0,0]], widgets: ['zebra']}); 
  

  var organicToggle = $("#organic_toggle");
  var organicCertifier = $("#organic_certifier :input");

  // Check status of organic_toggle, enable or disable organic_certifier as appropriate
  toggleStatus(organicToggle, organicCertifier);
  
  // Register hook so that if organic_certifier enables when organic_toggle is checked or unchecked
  organicToggle.click(toggleStatus(organicToggle, organicCertifier));
  
  function toggleStatus(toggleElement, targetElement) {
      if (toggleElement.is(':checked')) {
          targetElement.attr('disabled', true);
      } else {
          targetElement.removeAttr('disabled');
      }   
  }
    
  }
); 
