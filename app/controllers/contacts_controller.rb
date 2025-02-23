class ContactsController < ApplicationController
  def new
  end

  def create
    contact_params = params.permit(:name, :email, :message)
    ContactMailer.contact_email(contact_params).deliver_later
    flash[:notice] = "メールを送信しました"
    redirect_to root_path
  end
end
