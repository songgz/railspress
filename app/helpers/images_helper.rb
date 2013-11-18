module ImagesHelper
	
	def get_url(path, version)
		filename = "#{RP_IMAGE_NAME}.jpg"
		path.gsub(filename, "#{version}_#{filename}")
	end

end

