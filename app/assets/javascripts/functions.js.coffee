$(document).on 'ready page:load', ->
  $('#student_cpf').mask('000.000.000-00')
  $('#student_cep').mask('00000-000')
  $('#student_ddd').mask("(00)", onComplete: (ddd)->
    $("#student_phone").focus()
  )
  $('#student_phone').mask("0000-00009")

  $(".cep").mask("00000-000",
    onComplete: (cep) ->
      $.get("http://viacep.com.br/ws/#{cep}/json/").success( (data)->
        $("#student_district").val( data.bairro )
        $("#student_street").val( data.logradouro )
        $("#student_city").val( data.localidade )
        $("#student_state").val( data.uf )
        $("#student_number").focus()
      )
  )


  $("#students").autocomplete(
    delay: 500
    minLength: 3
    source: (request, response) ->
      $.ajax(
        url: window.url
        dataType: "json"
        data: {q: request["term"]}
        success: (data) ->
          if(!data.length)
            response([
              label: "Não foram encontrados resultados para sua busca. Clique para cadastar um estudante.",
              value: "-1"
            ])
          else
            response(data)
      )
    select: (event, ui) ->
      if ui.item.value == "-1"
        win = window.open(window.new_student_path, '_blank');
        win.focus();
        $("#students").val("")
      else
        if( confirm("Voce deseja matricular o estudante #{ui.item.label}?") )
          $.post("/courses/#{window.course_id}/enroll/#{ui.item.value}").success( ->
            console.log("matricula enviada")
          )

      return false
  );