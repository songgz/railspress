CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJW46DMTI4P2MQ7YQ',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-southeast-2'
  }
  
  config.fog_directory = 'workabroad' if Rails.env.production?
  config.fog_directory = 'workabroad-dev' if Rails.env.development?

end
