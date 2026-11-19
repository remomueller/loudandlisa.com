# frozen_string_literal: true

require "net/http"

# Handles all public facing pages.
class ExternalController < ApplicationController
  # # GET /
  # # GET /demos
  # def demos
  # end

  # # GET /services
  # def services
  # end

  # GET /clients
  def clients
    @logos = %w(
      dunkin-logo.jpg
      johnson-and-johnson-logo.jpg
      fanatics-logo.png
      fidelity-logo.jpg
      audible-logo.jpg
      campbells-logo.jpg
      lenovo-logo.png
      aetna-logo.jpg
      bose-logo.jpg
      1800-flowers-logo.jpg
      harvard-kennedy-school-logo.png
      hitachi-logo.png
      constant-contact-logo.png
      national-grid-logo.jpg
      boston-childrens-hospital-logo.jpg
      pearson-logo.jpg
      thumbtack-logo.png
      akamai-logo.png
      giant-eagle-logo.jpg
      ymca-logo.jpg
    )
  end

  # # GET /contact
  # def contact
  # end

  # POST /contact
  def submit_contact
    if params[:name].present? && params[:email].present? && params[:body].present? && verify_recaptcha
      UserMailer.contact(params[:name], params[:email], params[:body]).deliver_now if EMAILS_ENABLED
      redirect_to thanks_path
    else
      render :contact
    end
  end

  # # GET /version
  # # GET /version.json
  # def version
  # end

  private

  def verify_recaptcha
    return true unless RECAPTCHA_ENABLED

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{ENV["recaptcha_secret_key"]}&response=#{params[:recaptcha_token]}")
    result = JSON.parse(Net::HTTP.get(uri))

    result["success"] && result["score"] > 0.5 && result["action"] == "contact"
  end
end
