require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# initializer 'app_assets', after: 'importmap.assets' do
#   Rails.application.config.assets.paths << Rails.root.join('app') # for component sidecar js
# end

# initializer 'app_assets', after: 'importmap.assets' do
#   Rails.application.config.assets.paths << Rails.root.join('app') # for component sidecar js
# end

module Pollster
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Rails.application.config.assets.paths << 'app/components'

    initializer 'app_assets', after: 'importmap.assets' do
      Rails.application.config.assets.paths << Rails.root.join('app') # for component sidecar js
    end

    config.importmap.cache_sweepers << Rails.root.join('app/components')
  end
end
