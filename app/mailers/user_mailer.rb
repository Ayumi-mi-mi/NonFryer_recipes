class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: @user.email, subject: "パスワードリセットのお知らせ")
  end

  def activation_needed_email(user)
    @user = user
    @url = edit_activation_url(@user.activation_token)
    mail(to: @user.email, subject: "メールアドレス変更の確認")
  end
end
