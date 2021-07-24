class Public::GroupsController < ApplicationController
  #会員側グループ

  before_action :authenticate_user!

  def new
    @group = Group.new
    @group.users << current_user
  end

  #新規投稿確認ページ
  def confirm
    @group = Group.new(group_params)
    render :new if @group.invalid?
  end

  def create
    @group = Group.new(group_params)
    render :new and return if params[:back] || !@group.save
    redirect_to group_path(@group.id)
    flash[:notice]='グループを作成しました。'
  end

  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @group_posts = GroupPost.includes(:user).where(group_id: @group.id)

    # コメントの新規投稿
    @group_post = GroupPost.new

    end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, user_ids: [] )
  end

  def grouppost_params
    params.require(:group_posts).permit(:content)
  end

end
