# frozen_string_literal: true

# Handles all public facing pages.
class ExternalController < ApplicationController
  # # GET /contact
  # def contact
  # end

  # # GET /demos
  # def demos
  # end

  # # GET /home
  # def home
  # end

  # # GET /services
  # def services
  # end

  # POST /submit_contact
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
