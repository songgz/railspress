$(document).on 'page:change', ->
	#// Normal Analytics 
	if window._gaq?
		_gaq.push ['_trackPageview']
	#// Universal Analytics
	if window.pageTracker?
		pageTracker._trackPageview()