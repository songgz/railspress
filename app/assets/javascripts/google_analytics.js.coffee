$(document).on 'page:change', ->
  #// Normal Analytics 
  if window._gaq?
    _gaq.push ['_trackPageview']
  #// Universal Analytics
  elsif window.pageTracker?
    pageTracker._trackPageview()