class Admin::PostsController < ApplicationController
  #管理者側投稿ページ

  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to my_page_path
    flash[:notice] = '投稿を削除しました。'
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
