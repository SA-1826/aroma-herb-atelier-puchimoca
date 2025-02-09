class Public::GroupsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @group = Group.new
    @user = current_user
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    @join_groups = @user.join_groups
    @owner_groups = @user.owner_groups
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group.image.attach(params[:group][:image])
      flash[:notice] = "グループを作成しました"
      redirect_to group_path(@group)
    else
      flash.now[:danger] = "グループの作成に失敗しました"
      @user = current_user
      @new_programs = Program.published.order(created_at: :desc).limit(3)
      if @user.groups.present?
        @groups = @user.groups.all
      else
        @groups = []
      end
      render :new
    end
  end

  def index
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    @groups = Group.page(params[:page])
    @total_groups = Group.all
    @user = current_user
    @join_groups = @user.participating_join_groups
    @owner_groups = @user.owner_groups
  end

  def show
    @group = Group.find(params[:id])
    @user = current_user
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    @users = @group.users_include_owner
    @user_group_combinations = @group.user_group_combinations
    @join_groups = @user.participating_join_groups
    #@join_groups = @user.user_group_combinations.is_participating.map(&:group)
    @owner_groups = @user.owner_groups
  end

  def edit
    @group = Group.find(params[:id])
    @user = current_user
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    @join_groups = @user.join_groups
    @owner_groups = @user.owner_groups
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "更新しました"
      redirect_to group_path(@group)
    else
      flash.now[:danger] = "更新に失敗しました"
      @user = current_user
      @new_programs = Program.published.order(created_at: :desc).limit(3)
      @join_groups = @user.join_groups
      @owner_groups = @user.owner_groups
      render :edit
    end
  end

  private

  def is_matching_login_user
    @group = Group.find(params[:id])
    unless @group.owner == current_user
      redirect_to groups_path
    end
  end

  def group_params
    params.require(:group).permit(:name, :body, :image)
  end
end
