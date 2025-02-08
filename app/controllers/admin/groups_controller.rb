class Admin::GroupsController < ApplicationController
  layout 'admin'
  
  def index
    @groups = Group.page(params[:page])
    @total_groups_count = Group.all.count
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_groups_path
  end
end
