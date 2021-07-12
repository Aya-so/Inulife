class Public::PostsController < ApplicationController
  #会員側投稿ページ

  before_action :authenticate_user!

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to my_page_path
      flash[:notice] = '投稿に成功しました。'
    else
      render :new
    end
  end

  def show
    @user = current_user
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
