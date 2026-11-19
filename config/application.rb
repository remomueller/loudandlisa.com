# frozen_string_literal: true

require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module LoudAndLisa
  # Application that hosts Loud and Lisa website.
  class Application < Rails::Application
    config.load_defaults 8.1

    # Set Time.zone default to the specified zone.
    config.time_zone = "Eastern Time (US & Canada)"

    config.assets.js_compressor = :terser
  end
end
