$(document).ready(function() { 
  // Sort tables with class .tablesorter
  $(".tablesorter").tablesorter({sortList:[[0,0]], widgets: ['zebra']}); 
  
  // Check status of organic_toggle, enable or disable organic_certifier as appropriate
  toggleStatus();

  $("#farm_organic").change(function() {
    toggleStatus();
  });

  function toggleStatus() {
      if ($("#farm_organic").is(':checked')) {
          $("#farm_organic_certifier_id").removeAttr('disabled');
      } else {
          $("#farm_organic_certifier_id").attr('disabled', true);
      }   
  }
    
  }
); 
