# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( 
                                                  dashboard.css 
                                                  ordem_servicos.css 
                                                  clientes.css 
                                                  login.css 
                                                  perfils.css 
                                                  usuarios.css
                                                )
Rails.application.config.assets.precompile += %w( 
                                                  dashboard.js
                                                  ordem_servicos.js 
                                                  clientes.js 
                                                  login.js 
                                                  perfils.js  
                                                  usuarios.js
                                                )
