$ ->
  # $("#nav").localScroll duration: 800
  ($ "#nav").onePageNav changeHash: true, currentClass: 'active'

  markerPositioner()

  ($ '.title').each ->
    titleWidth = ($ @).width()
    ($ @).css 'margin', '0 0 0 ' + (((1000 - titleWidth)/2) - 10) + 'px'


markerPositioner = ->
  markerWid = ($ '.active').width()
  markerPos = ($ '.active').position().left + 20
  ($ '.marker').css 'width', markerWid + 'px'
  ($ '.marker').css 'left', markerPos + 'px'