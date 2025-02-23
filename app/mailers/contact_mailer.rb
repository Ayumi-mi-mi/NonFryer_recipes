class ContactMailer < ApplicationMailer
  default from: Rails.application.credentials.dig(:mailer, :email)

  def contact_email(contact_params)
    @name = contact_params[:name]
    @email = contact_params[:email]
    @message = contact_params[:message]

    mail(
      reply_to: @email,
      to: Rails.application.credentials.dig(:mailer, :email),
      subject: "【NonFryer Recipes】 お問い合わせがありました"
      )
  end
end
