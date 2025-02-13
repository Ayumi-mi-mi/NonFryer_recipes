class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー名を変更しました"
      redirect_to edit_profile_path
    else
      flash.now[:alert] = @user.errors.full_messages.join("、")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def not_authenticated
    redirect_to login_path
  end
end
