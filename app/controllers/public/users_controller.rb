class Public::UsersController < ApplicationController
  #会員側会員ページ

  before_action :authenticate_user!

  def show
    @user = User.find_by(name_id: params[:name_id])
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_show_path(@user)
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
