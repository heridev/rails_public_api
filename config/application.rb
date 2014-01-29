require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module PublicApi
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins 'localhost', 'http://htmlapiclient.herokuapp.com'
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :put]
      end
    end
  end
end
