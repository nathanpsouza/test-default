$enrollment = $("#enrollment_<%= @enrollment.id %>")
$enrollment.fadeOut(->
  $enrollment.remove()
)