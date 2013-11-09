ready = ->

	#// Sidebars
	if $('.stick_div').length
		if $('.page_main').height() > $('.sidebar').height()
			affix_start = $('.sidebar').offset().top + $('.non_stick_div').height()
			$('.stick_div').affix
				offset:
					top: affix_start,
					bottom: ->
        		this.bottom = $('.page_footer').outerHeight(true)+30
	        	#//return this.bottom = $('.page_footer').outerHeight(true)
		

#// For turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)