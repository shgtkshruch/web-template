# $ ->
#   interval = 3000
#   $('.slideshow').each -> 
#     container = $(this)
#     switchImg = ->
#       imgs = container.find('img')
#       first = imgs.eq 0
#       second = imgs.eq 1
#       first.fadeOut().appendTo container
#       second.fadeIn()
#     setInterval(switchImg, interval)
# 
$ ->
  interval = 3000
  $('.slideshow').each ->
    container = $(this)
    timer = ''
    switchImg = ->
      imgs = container.find('img')
      first = imgs.eq 0
      second = imgs.eq 1
      first.fadeOut().appendTo container
      second.fadeIn()
    startTimer = ->
      timer = setInterval(switchImg, interval)
    stopTimer = ->
      clearInterval(timer)
    container.find('img').hover(stopTimer, startTimer)
    startTimer()

