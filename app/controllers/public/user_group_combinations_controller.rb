class Public::UserGroupCombinationsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    current_user.join_group(group)
    redirect_to request.referer
  end

  def update
    @user_group_combination = UserGroupCombination.find(params[:id])
    if @user_group_combination.update(user_group_combination_params)
      flash[:notice] = "ステータスを更新しました"
      redirect_back(fallback_location: root_url)
    else
      flash[:alert] = "ステータスの更新に失敗しました"
      redirect_back(fallback_location: root_url)
    end
  end
  
  def destroy
    group = Group.find(params[:group_id])
    current_user.reject_group(group)
    redirect_to request.referer
  end

  private

  def user_group_combination_params
    params.require(:user_group_combination).permit(:status)
  end
end
