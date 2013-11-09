module ImagesHelper
	
	def get_url(path, version)
		filename = 'workabroad.jpg'
		path.gsub(filename, "#{version}_#{filename}")
	end

end