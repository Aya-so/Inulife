class Public::UsersController < ApplicationController
  #会員側会員ページ

  before_action :authenticate_user!

  def show
    @user = current_user
    @post = Post.new
    @posts = Post.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path
      flash[:notice]='ユーザー情報を修正しました。'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :name_id, :profile_image, :email, :encrypted_password, :is_active)
  end

end
