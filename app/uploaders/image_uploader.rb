# encoding: utf-8
require 'carrierwave/processing/mime_types'

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # MimeType
  include CarrierWave::MimeTypes
  process :set_content_type

  # Amazon S3
  if Rails.env.production?
    storage :fog
  end

  # Local strage
  if Rails.env.test? or Rails.env.development?
    storage :file 
  end

  def store_dir
  	time = Time.now
  	year = time.strftime("%Y")
  	"images/#{year}/#{model.id}"
	end

  # Process files as they are uploaded:
  process :resize_to_limit => [600, 600]
  process :convert => 'jpg'

  # Create different versions of your uploaded files:
  version :sm do
    process :resize_to_limit => [100, 100]
    process :convert => 'jpg'
  end

  version :md do
    process :resize_to_limit => [300, 300]
    process :convert => 'jpg'
  end

  

  # For large files. Check the doc in github.
  def move_to_cache
    true
  end
  def move_to_store
    true
  end


  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    if original_filename.present?
      filename = "workabroad.jpg"
    end
  end

  # Saving the Original Filename
  before :cache, :save_original_filename
  def save_original_filename(file)
    altname = file.original_filename.gsub(".#{file.extension}", "")
    model.alt ||= altname if file.respond_to?(:original_filename)
  end

  # Saving model id for association
  #before :cache, :save_model_id
  #def save_model_id(file)
    #model.model_id ||= model.id if file.respond_to?(:original_filename) 
  #end

end

