class Public::UsersController < ApplicationController
  def mypage
    @user = User.find(current_user)
    @posts = current_user.posts.all
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
