# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['website_name']} <#{ENV['smtp_email']}>"
  layout 'mailer'

  protected

  def setup_email
  end
end
