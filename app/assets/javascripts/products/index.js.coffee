$ ->
  $forms = $('.select-category')
  $forms.each (i, el) ->
    $('input[type=submit]', el).hide()
    $('select', el).on 'change', (ev) -> 
      $(el).submit() 