class Admin::GroupPostsController < ApplicationController

  def destroy
    @group_post = GroupPost.find(params[:id])
    @group = @group_post.group
    @group_post.destroy
      redirect_to admin_group_path(@group.id)
      flash[:notice]="コメントを削除しました。"
  end

  private
  def group_post_params
    params.require(:group_post).permit(:contents)
  end

end
