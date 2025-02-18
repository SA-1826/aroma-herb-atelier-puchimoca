class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :withdraw]
  #before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
    @posts = @user.posts.page(params[:posts_page]).per(6)
    @total_posts_count = @user.posts.count
    @comments = @user.comments.page(params[:comments_page]).per(6)
    @total_comments_count = @user.comments.count
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_attributes = current_user.guest_user? ? guest_user_params : user_params
    @user = User.find(params[:id])
    if @user.update(user_attributes)
      flash[:notice] = "変更を保存しました"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "変更の保存に失敗しました"
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:posts_page]).per(6)
    @total_posts_count = @user.posts.count
    @comments = @user.comments.page(params[:comments_page]).per(6)
    @total_comments_count = @user.comments.count
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    if @user == current_user
      redirect_to mypage_path
    else
      render :show
    end
  end

  def withdraw
    current_user.update_attribute(:is_active, 'false')
    sign_out(current_user)
    redirect_to new_user_registration_path, notice: "退会しました"
  end

  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(params[:id])
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def guest_user_params
    params.require(:user).permit(:name)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to mypage_path, notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end
