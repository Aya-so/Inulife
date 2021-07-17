class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id

    if @post_comment.save
      flash[:notice]="コメントを記載しました。"
    else
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find_by(id: params[:id], postid: params[:post_id])
    @post_comment.destroy
      flash[:notice]="コメントを削除しました。"
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end