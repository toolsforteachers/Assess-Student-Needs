jQuery ->
    $('.indicator_score').live 'click', ->
    $(this).parents("form").submit()
