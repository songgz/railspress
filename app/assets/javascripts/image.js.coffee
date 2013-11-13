ready = ->

	##########// jQuery file upload //#########
  
	if $('.image_widget').length

		#// Initialization is necessary
		$('.image_widget').fileupload()

		$('.image_widget').fileupload('option',
			dataType: "script",
			dropZone: "#image_widget_modal",
			disableImageResize: false,
			maxFileSize: 5000000,
			#//autoUpload: false,
			#//disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
      #//acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
			imageMaxWidth: 600,
			imageMaxHeight: 600,
			imageCrop: false,

#//			processQueue: [
#//				{
#//					action: 'resize',
#//					imageMaxWidth: 10,
#//					imageMaxHeight: 10,
#//				},
#//				{
#//					action: 'save'
#//				},
#//			]

			add: (e, data) ->
				types = /(\.|\/)(gif|jpe?g|png)$/i
				file = data.files[0]
				#// File type validation before submit
				if types.test(file.type) || types.test(file.name)
					if file.size < 5000000
						#// Make space for the image with id
						#// rand_id almost does nothing.
						#// Not need to add id unless you can replace box with proper image.
						rand_id = random_str(16)
						$('#images').prepend('<div id="'+rand_id+'" class="thumb wating"><img class="indicator" src="/assets/ajax_loader_green.gif"></div>')
						#// Progress bar
						data.context = $(tmpl("template-upload", file).trim())
						$('#' + rand_id).append(data.context)
						#// Submit
						data.submit()
					else
						display_size = (parseInt(file.size) / 1048576).toFixed(2)
						alert("File size is too big. Maximum:5MB (was #{display_size}MB) ")
				else
					alert("#{file.name} is not a gif, jpeg, or png image file")

			progress: (e, data) ->
				if data.context
					progress = parseInt(data.loaded / data.total * 100, 10)
					#// data.context.find('.bar').css('width', progress + '%')
					data.context.find('.progress-bar').css('width', progress + '%').attr('aria-valuenow', progress)
			)


	if $('.image_widget').length

		$('#images').on 'click', '.thumb', (event) ->
			if !$(this).hasClass('wating')
				#// Set URL to hidden tag
				caret_pos = getCaretPosition($('.post_content').get(0))
				url = $('img', this).data('image-url').replace('workabroad.s3.amazonaws.com', 'image.workabroad.jp')
				alt = $('img', this).attr('alt')
				tag = "![#{alt}](#{url})"
				#tag = '<img src="'+url+'" alt="'+alt+'">\n'
				#// Insert image tag
				insertTextAtPosision($('.post_content').get(0), caret_pos, tag)

	$('.my_folder').on 'click', (event) ->
		$(this).addClass('disabled')




#// Create random letters
#// http://taitan916.hateblo.jp/entry/2013/06/17/223000
random_str = (num) ->
  str = "";
  letters = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
  len = letters.length
  for i in [0..num]
  	rand = parseInt( Math.random() * len )
  	str += letters.charAt(rand)
  str


#// Insert text into textarea
#// Ref: http://yotsuba-system.com/ponta/archives/50
insertTextAtPosision = (obj, pos, txt) ->
  obj.focus()
  s = obj.value
  np = pos + txt.length
  obj.value = s.substr(0, pos) + txt + s.substr(pos)
  obj.setSelectionRange(np, np)

getCaretPosition = (obj) ->
  obj.focus()
  pos = obj.selectionStart




#// For turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)