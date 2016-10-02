# frozen_string_literal: true

# Main web application class that hosts static and public facing pages.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
