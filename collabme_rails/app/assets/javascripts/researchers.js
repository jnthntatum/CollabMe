$(document).ready(function() {
  var activity_count = 0;
  var course_count = 0;

  $('.high_school_controls').toggle();
  $('.research_lab_controls').toggle();

  $('#education_type').change(function() {
    $('.university_controls').toggle();
    $('.high_school_controls').toggle();
  });

  $('#work_experience_type').change(function() {
    $('.company_controls').toggle();
    $('.research_lab_controls').toggle();
  });

  $.getJSON('/schools/universities', function(data) {
    var university_names = [];
    var university_locations = [];

    $.each(data, function(key, val) {
      university_names.push(val['name']);
      university_locations.push(val['location']);
    });

    $('#university_name').typeahead({source: university_names});

    $('#university_name').change(function() {
      var university_name = $('#university_name').val();
      var university_index = $.inArray(university_name, university_names);

      if (university_index != -1) {
        $('#university_location').val(university_locations[university_index]);
      } 

    });
  });

  $.getJSON('/schools/high_schools', function(data) {
    var high_school_names = [];
    var high_school_locations = [];

    $.each(data, function(key, val) {
      high_school_names.push(val['name']);
      high_school_locations.push(val['location']);
    });

    $('#high_school_name').typeahead({source: high_school_names});

    $('#high_school_name').change(function() {
      var high_school_name = $('#high_school_name').val();
      var high_school_index = $.inArray(high_school_name, high_school_names);

      if (high_school_index != -1) {
        $('#high_school_location').val(high_school_locations[high_school_index]);
      } 

    });
  });

  $.getJSON('/companies/companies', function(data) {
    var company_names = [];
    var company_locations = [];

    $.each(data, function(key, val) {
      company_names.push(val['name']);
      company_locations.push(val['location']);
    });

    $('#company_name').typeahead({source: company_names});

    $('#company_name').change(function() {
      var company_name = $('#company_name').val();
      var company_index = $.inArray(company_name, company_names);

      if (company_index != -1) {
        $('#company_location').val(company_locations[company_index]);
      } 

    });
  });

  $.getJSON('/research_labs/research_labs', function(data) {
    var research_lab_names = [];
    var research_lab_locations = [];
    var research_lab_focuses = [];

    $.each(data, function(key, val) {
      research_lab_names.push(val['name']);
      research_lab_locations.push(val['location']);
      research_lab_focuses.push(val['focus']);
    });

    $('#research_lab_name').typeahead({source: research_lab_names});

    $('#research_lab_name').change(function() {
      var research_lab_name = $('#research_lab_name').val();
      var research_lab_index = $.inArray(research_lab_name, research_lab_names);

      if (research_lab_index != -1) {
        $('#research_lab_location').val(research_lab_locations[research_lab_index]);
        $('#research_lab_focus').val(research_lab_focuses[research_lab_index]);
      } 

    });
  });

  $('#course_plus').click(function() {
    var course_title = escapeHtml($('#course_title').val());
    var course_description = escapeHtml($('#course_description').val());
    $('#courses').append('<p>' + course_title + '  -  ' + course_description + '</p>');
    $('#courses').append('<input type="hidden" name="course_title_' + course_count + '" value="' + course_title + '" />');
    $('#courses').append('<input type="hidden" name="course_description_' + course_count + '" value="' + course_description + '" />');
    $('#course_title').val('');
    $('#course_description').val('');
    course_count++;
  });

  $('#education_start_date_month').change(function () {
    $('#hidden_education_start_date_month').val($('#education_start_date_month').val());
  });

  $('#education_start_date_year').change(function () {
    $('#hidden_education_start_date_year').val($('#education_start_date_year').val());
  });

  $('#education_end_date_month').change(function () {
    $('#hidden_education_end_date_month').val($('#education_end_date_month').val());
  });

  $('#education_end_date_month').change(function () {
    $('#hidden_education_end_date_year').val($('#education_end_date_year').val());
  });

  $('#work_experience_plus').click(function() {
    var activity = escapeHtml($('#activity').val());
    $('#activities').append('<p>-  ' + activity + '</p>');
    $('#activities').append('<input type="hidden" name="activity_' + activity_count + '" value="' + activity + '" />');
    $('#activity').val('');
    activity_count++;
  });

  $('#work_experience_start_date_month').change(function () {
    $('#hidden_work_experience_start_date_month').val($('#work_experience_start_date_month').val());
  });

  $('#work_experience_start_date_year').change(function () {
    $('#hidden_work_experience_start_date_year').val($('#work_experience_start_date_year').val());
  });

  $('#work_experience_end_date_month').change(function () {
    $('#hidden_work_experience_end_date_month').val($('#work_experience_end_date_month').val());
  });

  $('#work_experience_end_date_month').change(function () {
    $('#hidden_work_experience_end_date_year').val($('#work_experience_end_date_year').val());
  });
});