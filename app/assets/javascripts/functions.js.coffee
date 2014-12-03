$(document).on 'ready page:load', ->
  $('.carousel').carousel(
    interval: 5000
  )

  $('#profile_cpf').mask('000.000.000-00')
  $('#profile_cep').mask('00000-000')
  $('#profile_ddd').mask("(00)", onComplete: (ddd)->
    $("#profile_phone").focus()
  )
  $('#profile_phone').mask("0000-00009")

  $(".cep").mask("00000-000",
    onComplete: (cep) ->
      $.get("http://viacep.com.br/ws/#{cep}/json/").success( (data)->
        $("#profile_district").val( data.bairro )
        $("#profile_street").val( data.logradouro )
        $("#profile_city").val( data.localidade )
        $("#profile_state").val( data.uf )
      )
  )