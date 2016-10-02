# frozen_string_literal: true

# Handles all public facing pages.
class ExternalController < ApplicationController
  def contact
  end

  def demos
  end

  def home
  end

  def services
  end

  def submit_contact
    if params[:name].present? && params[:email].present? && params[:body].present?
      UserMailer.contact(params[:name], params[:email], params[:body]).deliver_now if EMAILS_ENABLED
      redirect_to thanks_path
    else
      render :contact
    end
  end

  def version
  end
end
