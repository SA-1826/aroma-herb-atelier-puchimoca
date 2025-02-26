class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.page(params[:users_page])
    @total_users_count = User.all.count
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    @total_posts_count = @user.posts.count
    @comments = @user.comments.page(params[:page])
    @total_comments_count = @user.comments.count
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
