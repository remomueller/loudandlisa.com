# frozen_string_literal: true

# Development and test generate a secret automatically; production reads it from config/application.yml.
Rails.application.config.secret_key_base = ENV["website_secret"] if ENV["website_secret"].present?
