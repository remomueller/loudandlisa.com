# frozen_string_literal: true

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
      aetna-logo.jpg
      lingochamp-logo.jpg
      audible-logo.jpg
      1800-flowers-logo.jpg
      campbells-logo.jpg
      dunkin-logo.jpg
      bose-logo.jpg
      giant-eagle-logo.jpg
      adore-me-logo.jpg
      pearson-logo.jpg
      national-grid-logo.jpg
      fidelity-logo.jpg
      johnson-and-johnson-logo.jpg
      stride-rite-logo.jpg
      thumbtack-logo.jpg
      heluva-good-logo.jpg
      acrolinx-logo.jpg
      boston-childrens-hospital-logo.jpg
      cocoon-logo.jpg
      ymca-logo.jpg
      embark-logo.jpg
    )
  end

  # # GET /contact
  # def contact
  # end

  # POST /contact
  def submit_contact
    if params[:name].present? && params[:email].present? && params[:body].present?
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
end
