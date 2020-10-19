require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreshFoodPriceChecker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    #lib/language.rbを読み取るため追記
    config.paths.add 'lib', eager_load: true
    #デフォルト言語を日本語とする
    config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #日本時間対応
    config.time_zone = "Tokyo"

    #active_adminのデザイン、メンバーページへの干渉防止
    config.assets.paths << config.root.join("vendor/assets/javascripts")
    config.assets.paths << config.root.join("vendor/assets/stylesheets")
  end
end
