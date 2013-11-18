class Image < ActiveRecord::Base

	belongs_to :user

	# Specify the date order
	default_scope -> { order('created_at DESC') }

	# Image upload
	mount_uploader :url, ImageUploader

end
