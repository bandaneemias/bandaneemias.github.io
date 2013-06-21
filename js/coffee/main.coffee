$ ->
  # $("#nav").localScroll duration: 800
  ($ "#nav").onePageNav changeHash: true, currentClass: 'active'

  markerPositioner()

  ($ '.title,.subtitle').each ->
    parWidth = ($ @).parent().width()
    titleWidth = ($ @).width()
    ($ @).css 'margin', '0 0 0 ' + (((parWidth - titleWidth)/2) - 10) + 'px'

  # rightHeight = ($ '.right-wrapper').height()
  # ($ '.left-wrapper').css 'height', rightHeight

markerPositioner = ->
  markerWid = ($ '.active').width()
  markerPos = ($ '.active').position().left + 20
  ($ '.marker').css 'width', markerWid + 'px'
  ($ '.marker').css 'left', markerPos + 'px'