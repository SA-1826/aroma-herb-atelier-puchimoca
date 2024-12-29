class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @posts = @user.posts.all
  end

  def edit
  end

  def update
  end

  def show
  end

  def withdraw
  end
end
