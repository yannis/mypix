# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.asset_host = ENV['ASSET_HOST']
    if Rails.env.test?
      config.enable_processing = false
    end
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => ENV['FOG_PROVIDER'],
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => ENV['FOG_REGION'],
      # :host                   => 's3.example.com',             # optional, defaults to nil
      # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = ENV['FOG_DIRECTORY']                     # required
    # config.fog_public     = false                                   # optional, defaults to true
    # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
