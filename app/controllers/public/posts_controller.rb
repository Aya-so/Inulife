class Public::PostsController < ApplicationController
  #会員側投稿ページ

  before_action :authenticate_user!, only: [:show]


  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to my_page_path
      flash[:notice] = '投稿に成功しました。'
    else
      render ('public/users/show')
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to my_page_path
    flash[:notice] = '投稿を削除しました。'
  end

  # 投稿をランキング表示
  def rank
    @all_ranks = Post.includes(:user).find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
