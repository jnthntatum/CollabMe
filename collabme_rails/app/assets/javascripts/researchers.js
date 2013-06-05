$(document).ready(function() {
  $('#education_type').change(function() {
    $('.university_controls').toggle();
  });

  $.getJSON('/schools/', function(data) {
    $.each(data, function(key, val) {
      alert(data[key]);
    });
  });
});