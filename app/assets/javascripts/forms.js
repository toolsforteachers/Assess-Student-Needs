$(document).on('nested:fieldAdded', function(event){
  var target = event.field.find('.objective-name');
  if (target) {
    var existing_nested_field_count = $('.objective-name').length;
    target.val('Stream ' + existing_nested_field_count);
   }
 });

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

