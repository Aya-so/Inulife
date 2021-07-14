class Public::GroupsController < ApplicationController
  #会員側グループページ

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
    @group = Group.find_by(id: params[:id])
    if !@group.users.include?(current_user)
      @group.users << current_user
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduciton, user_ids: [] )
  end

end
