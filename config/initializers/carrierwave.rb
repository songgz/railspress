CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIUAYFA3KZVSELF6A',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }
  
  config.fog_directory = 'workabroad' if Rails.env.production?
  #config.fog_directory = 'workabroad-dev' if Rails.env.development?

end
