class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "変更の保存に失敗しました"
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def withdraw
    current_user.update_attribute(:is_active, 'false')
    sign_out(current_user)
    redirect_to new_user_registration_path, notice: "退会しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
