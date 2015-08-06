$(document).on('nested:fieldAdded', function(event){
  var target = event.field.find('.objective-name');
  if (target) {
    existing_nested_field_count = $('.objective-name').length;
    target.val('Stream ' + existing_nested_field_count);
   };
 });

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
})
