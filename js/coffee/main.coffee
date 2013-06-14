$ ->

  $(window).resize (event) ->
    minWidth = 1000

    if $(window).width() < minWidth
      ($ '.bgimg').css 'background-size', minWidth + 'px auto'
      ($ '.bgimg').css 'background-position', 'left center'
    else
      ($ '.bgimg').css 'background-size', '100% auto'
      ($ '.bgimg').css 'background-position', 'center center'