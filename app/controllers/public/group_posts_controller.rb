class Public::GroupPostsController < ApplicationController
  #会員側グループポスト

  before_action :authenticate_user!

  def create
    @group = Group.find_by(id: params[:group_id])
    @group_post = current_user.group_posts.new(group_post_params)
    @group_post.group_id = params[:group_id]

    if @group_post.save
      redirect_to group_path(@group.id)
      flash[:notice]='コメントを記載しました。'
    else
      render 'groups/show'
    end
  end

  private
  def group_post_params
    params.require(:group_post).permit(:contents)
  end

end
