class Admin::PostsController < ApplicationController
  #管理者側投稿

  before_action :authenticate_admin!

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
    flash[:notice] = '投稿を削除しました。'
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
