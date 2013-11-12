CarrierWave.configure do |config|

	# This is necessary for sitemap_generator
	config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIUAYFA3KZVSELF6A',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  # Bucket name
  config.fog_directory = 'workabroad'
  
end
