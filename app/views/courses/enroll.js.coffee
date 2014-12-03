
<% if @already_enrolled %>
alert "Já existe uma matrícula para o usuário"
<% else %>
$("#students-table").append(
  $("<tr>").attr("id", "enrollment_<%= @enrollment.id %>" ).append(
    $("<td>").html("<%= @enrollment.student.id %>")
    $("<td>").html("<%= @enrollment.student.name %>")
    $("<td>").html('<%= @enrollment.created_at %>')
    $("<td>").append(
      $('<%= @link_to_see %>')
      $('<%= @link_to_remove %>')
    )
  )
)
$("#nothing").remove()
<% end %>
$("#students").val("")