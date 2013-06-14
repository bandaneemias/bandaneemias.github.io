$ ->
  # $("#nav").localScroll duration: 800
  ($ "#nav").onePageNav changeHash: true, currentClass: 'active'

  ($ '.marker').css 'transition', 'none'
  markerPositioner()
  ($ '.marker').css 'transition', 'all .8s'

  ($ '.title').each ->
    titleWidth = ($ @).width()
    ($ @).css 'margin', '0 0 0 ' + (((1000 - titleWidth)/2) - 10) + 'px'


markerPositioner = ->
  markerWid = ($ '.active').width()
  markerPos = ($ '.active').offset().left
  ($ '.marker').css 'width', markerWid + 'px'
  ($ '.marker').css 'left', markerPos + 'px'