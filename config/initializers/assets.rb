# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# initializer 'app_assets', after: 'importmap.assets' do
#   Rails.application.config.assets.paths << Rails.root.join('app') # for component sidecar js
# end
# Rails.application.config.assets.paths << 'app/components'
# config.importmap.cache_sweepers << Rails.root.join('app/components')

Rails.application.config.assets.paths << 'app/components'
Rails.application.config.assets.debug = true
