class Public::GroupPostsController < ApplicationController

  def new
    @group_post = current_user.groupposts.new
    @group = Group.find_by(id: params[:group_id])
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    @group_post = current_user.group_post.new(group_post_params)
    @group_post.group_id = params[:group_id]
    if @group_post.save
      redirect_to group_path(@group.id)
    end
  end

  private
    def group_post_params
      params.require(:group_post).permit(:content)
    end

end
