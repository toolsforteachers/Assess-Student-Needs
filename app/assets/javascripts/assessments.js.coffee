jQuery ->
  $('#assessment_simple_lesson_date').datepicker(format: 'dd/mm/yyyy', "autoclose": true)

  $('#update_indicator_list').click ->
    $('#assessment_indicator_id').empty()
    level = $('#assessment_level option:selected').val()
    key = $('#assessment_key option:selected').val()
    target = "/indicators?level=#{ level }&key=#{ key }"
    $('#update_indicator_list').attr('href', target)