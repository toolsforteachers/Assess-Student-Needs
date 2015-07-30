$(document).on('nested:fieldAdded', function(event){
  var target = event.field.find('.objective-name');
  if (target) {
    existing_nested_field_count = $('.objective-name').length;
    target.val('Stream ' + existing_nested_field_count);
   };
 });

$(document).on('click', '.btn.asssessment-score', function (e) {
  var submit_button = $(this).closest('form').find(':submit')
  submit_button.removeClass('hidden');
  submit_button.addClass('btn btn-default');
})
