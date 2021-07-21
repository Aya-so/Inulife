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
      redirect_to users_show_path(current_user.name_id)
      flash[:notice] = '投稿に成功しました。'
    else
      render ('public/users/show')
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user

    # コメントの新規投稿
    @post_comment = PostComment.new

    # タグ表示
    @tags = @post.tag_counts_on(:tags)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_show_path(current_user.name_id)
    flash[:notice] = '投稿を削除しました。'
  end

  # 投稿をランキング表示
  def rank
    @all_ranks = Post.includes(:user).find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption, :tag_list)
  end

end
