class Admin::UsersController < ApplicationController
  #管理者側会員

  before_action :authenticate_admin!

  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
      flash[:notice] = '会員情報を修正しました。'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :name_id, :profile_image, :email, :encrypted_password, :is_active)
  end

end
