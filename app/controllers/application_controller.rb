class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home

  end


  def submit_contact
    if params[:name].present? and params[:email].present? and params[:body].present?
      # UserMailer.contact(params[:name], params[:email], params[:body]).deliver_later if Rails.env.production?
      redirect_to contact_path, notice: "Thanks for getting in touch!"
    else
      render :contact
    end
  end

end
