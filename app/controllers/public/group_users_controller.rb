class Public::GroupUsersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.create(group_id: params[:group_id], user_id: current_user.id)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find_by(group_id: params[:group_id], user_id: current_user.id)
    @group_user.destroy
    redirect_to group_path(@group)
  end

end
