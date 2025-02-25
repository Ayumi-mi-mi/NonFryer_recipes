class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:notice] = "パスワードリセットのメールを送信しました"
      redirect_to root_path
    else
      flash[:alert] = "メールアドレスが見つかりません"
      render :new
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      flash[:notice] = "パスワードを変更しました"
      redirect_to login_path
    else
      flash.now[:alert] = "パスワードの変更に失敗しました"
      render :edit
    end
  end
end
