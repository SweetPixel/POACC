require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module POACC
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.enabled = true

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    Spud::Photos.configure do |config|
      config.base_layout = 'application'
      config.galleries_enabled = true
      config.base_path = 'photos'
      config.photo_styles = {
        :small => '50x50#',
        :medium => '200x200#',
        :large => '400x400#',
        :huge => '600x600'
    }
  config.paperclip_storage = :filesystem #use :s3 to use s3 storage (aws gem required)
  # config.s3_credentials = "#{Rails.root}/config/s3.yml"
  config.storage_path = ":rails_root/public/system/spud_photos/:id/:style/:basename.:extension"
  config.storage_url = "/system/spud_photos/:id/:style/:basename.:extension"
      # config.s3_host_name = "s3.amazonaws.com" #Defaults to us east zone, change for other regions.
  end
end
end
