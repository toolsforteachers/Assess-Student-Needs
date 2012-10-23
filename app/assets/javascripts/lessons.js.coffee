$('#lesson_simple_lesson_date').datepicker(format: 'dd/mm/yyyy', "autoclose": true)

$('#update_indicator_list').click =>
  $('#lesson_indicator_id').empty()
  level = $('#lesson_level option:selected').val()
  key = $('#lesson_key option:selected').val()
  target = "/indicators?level=#{ level }&key=#{ key }"
  $('#update_indicator_list').attr('href', target)