class ActivationsController < ApplicationController
  before_action :require_login

  def new
  end

  def update
    if current_user.update(
      unconfirmed_email: params[:email],
      activation_state: "pending",
      activation_token: SecureRandom.urlsafe_base64
    )
      UserMailer.activation_needed_email(current_user).deliver_later
      flash[:notice] = "確認メールを送信しました。メールを確認してください。"
      redirect_to root_path
    else
      flash[:alert] = "メールアドレスの変更に失敗しました。"
      render :new
    end
  end

  def edit
    user = User.find_by(activation_token: params[:id])
    if user
      user.activate!
      flash[:notice] = "メールアドレスが変更されました"
      redirect_to root_path
    else
      flash[:alert] = "無効なトークンです"
      redirect_to root_path
    end
  end
end
