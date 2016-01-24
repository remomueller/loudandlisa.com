# Handles all public facing pages
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
      UserMailer.contact(params[:name], params[:email], params[:body]).deliver_later if EMAILS_ENABLED
      redirect_to contact_path, notice: 'Thanks for getting in touch!'
    else
      render :contact
    end
  end

  def version
  end
end
