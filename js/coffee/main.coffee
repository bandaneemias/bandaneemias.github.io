$ ->
  # $("#nav").localScroll duration: 800
  $("#nav").onePageNav scrollSpeed: 750, changeHash: false, currentClass: 'active'


  titleObj = ($ '.title')
  titleWidth = titleObj.width()
  titleObj.css 'margin', '0 ' + (((1000 - titleWidth)/2) + 10) + 'px ' + '0 ' + (((1000 - titleWidth)/2) - 10) + 'px'