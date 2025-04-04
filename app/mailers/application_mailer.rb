class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:mailer, :email)
  default from: ENV.fetch("SMTP_FROM_ADDRESS", "ayumari0806@example.com")
  layout "mailer"
end
