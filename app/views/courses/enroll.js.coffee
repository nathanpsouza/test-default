
<% if @already_enrolled %>
alert "Já existe uma matrícula para o usuário"
<% else %>
$row = $("<tr>").css(display: 'none').attr("id", "enrollment_<%= @enrollment.id %>" ).append(
  $("<td>").html("<%= @enrollment.student.id %>")
  $("<td>").html("<%= @enrollment.student.name %>")
  $("<td>").html('<%= @enrollment.created_at %>')
  $("<td>").addClass("pull-right").append(
    $('<%= @link_to_see %>')
    $('<%= @link_to_remove %>')
  )
)
$("#students-table").append( $row )
$row.fadeIn()
$(".nothing").remove()
<% end %>
$("#students").val("")