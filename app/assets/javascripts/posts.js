$(document).ready(function() {
  $('#post_new_link').click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    $('#post_new_form').toggle('fade');
  });

  $('#post_new_form').submit(function(event) {
    $('#post_new_form').toggle('fade', function() {
      $('#post_new_form').get(0).reset();
    });
  });
});
