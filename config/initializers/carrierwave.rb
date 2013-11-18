CarrierWave.configure do |config|

	# This is necessary for sitemap_generator
	config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['RP_AWS_KEY'],
    :aws_secret_access_key  => ENV['RP_AWS_SECRET'],
    :region                 => ENV['RP_AWS_REGION']
  }

  # Bucket name
  config.fog_directory = ENV['RP_AWS_BUCKET']
  
end

