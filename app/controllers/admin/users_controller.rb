class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    @comments = @user.comments.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "変更の保存に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
end
