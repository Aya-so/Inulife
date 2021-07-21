class Admin::GroupsController < ApplicationController
  #管理者側グループページ

  before_action :authenticate_admin!

  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @group_post = GroupPost.where(group_id: @group.id).all
  end

  def destroy
  @group = Group.find(params[:id])
  @group.destroy
  redirect_to admin_groups_path
  flash[:notice] = 'グループを削除しました。'
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, user_ids: [] )
  end

  def grouppost_params
    params.require(:group_posts).permit(:content)
  end

end
