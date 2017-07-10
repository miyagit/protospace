require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Protospace
  class Application < Rails::Application
  	config.time_zone = 'Tokyo'
  end
end
