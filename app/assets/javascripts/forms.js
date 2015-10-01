$(document).on('click', '.toggle-assessment-form', function (e) {
  e.preventDefault();
  var tr = $(this).closest('tr');
  $(tr).find('td.score').toggleClass('hidden');
  $(tr).find('td.notes').toggleClass('hidden');
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

$(document).on('click', 'a.teaching-materials', function(e) {
  e.preventDefault();
  $('.teaching_material_upload_fields').toggleClass('hide');
});

$(document).ready(function() {
  $('.editable-score').editable({
    mode: 'inline',
    showbuttons: false,
    source: [
          {value: 0, text: 'n/a'},
          {value: 1, text: '1'},
          {value: 2, text: '2'},
          {value: 3, text: '3'},
          {value: 4, text: '4'},
          {value: 5, text: '5'}
       ],
    params: {
      'assessment[out_of]': 5
    }
  });

  $('.editable-score').on('save', function(e, params) {
    var td = $(this).closest('td');
    $(td).removeClass();
    $(td).addClass('score');
    $(td).addClass('score_' + (params.newValue * 20));
  })
});

$(document).ready(function() {
  $('.editable-notes').editable({
    mode: 'inline',
    emptytext: 'Notes',
    rows: 5
  });
});
