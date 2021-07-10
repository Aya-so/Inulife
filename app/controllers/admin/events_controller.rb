class Admin::EventsController < ApplicationController
  #管理者側イベントページ

  before_action :authenticate_admin!

  def index
    @events = Event.all
    @events = Event.page(params[:page]).per(10)
  end

  def show
    @event = Event.find(params[:id])
  end

  #イベント新規投稿
  def new
    @event = Event.new
  end

  #新規投稿確認ページ
  def confirm
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_event_path(@event)
      flash[:notice] = '新しいイベントを作成しました。'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_event_path(@event.id)
      flash[:notice] = 'イベント情報を修正しました。'
    else
      render :edit
    end
  end

  #イベントを削除
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'イベントを削除しました。'
    redirect_to admin_events_path
  end

  private
  def event_params
    params.require(:product).permit(:title, :introduction, :image, :event_status)
  end

end
