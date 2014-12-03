$enrollment = $("#enrollment_<%= @enrollment.id %>")
$enrollment.fadeOut(->
  $enrollment.remove()
  <%- if @course.enrollments.empty? %>
  $nothing = $("<tr>").css(display: "none").addClass("nothing").append(
    $("<td>").attr("colspan", 3).html("Não existem estudantes matriculados.")
  )

  $("#students-table").append( $nothing )
  $nothing.fadeIn()
  <%- end %>
)