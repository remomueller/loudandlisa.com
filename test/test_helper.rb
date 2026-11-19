# frozen_string_literal: true

require "simplecov"
SimpleCov.start "rails" do
  skip "/lib/"
end
require "minitest/pride"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
