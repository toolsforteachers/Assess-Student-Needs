$(document).on('click', '.toggle-assessment-form', function (e) {
  e.preventDefault();
  var tr = $(this).closest('tr');
  $(tr).find('td.stream').toggleClass('hidden');
  $(tr).find('td.score').toggleClass('hidden');
  $(tr).find('td.notes').toggleClass('hidden');
  $(tr).find('td.attempts').toggleClass('hidden');
  $(tr).find('td.assessment-form').toggleClass('hidden');
  $(tr).find('span.glyphicon').toggleClass('glyphicon-minus');
});

$(document).on('click', '.glyphicon-collapser', function() {
  $(this).find('span.glyphicon').toggleClass('glyphicon-plus');
  $(this).find('span.glyphicon').toggleClass('glyphicon-minus');
});

$(document).on('click', '.lesson .pick-indicator', function(e) {
  e.preventDefault();
  var indicator_id = $(this).attr('id').split('_')[1];
  $('#objective_indicator_id').val(indicator_id);
  $('#objective_indicator_id').closest('form').submit();
});
