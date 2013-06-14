$ ->
  # $("#nav").localScroll duration: 800
  ($ "#nav").onePageNav changeHash: true, currentClass: 'active'

  markerPositioner()

  # ($ '#nav').click ->
  # ($ '#nav').bind 'classChanged' ->
  #   markerPositioner()

  ($ '.title').each ->
    titleWidth = ($ @).width()
    ($ @).css 'margin', '0 ' + (((1000 - titleWidth)/2) + 10) + 'px ' + '0 ' + (((1000 - titleWidth)/2) - 10) + 'px'


markerPositioner = ->
  markerWid = ($ '.active').width()
  markerPos = ($ '.active').offset().left
  ($ '.marker').css 'width', markerWid + 'px'
  ($ '.marker').css 'left', markerPos + 'px'