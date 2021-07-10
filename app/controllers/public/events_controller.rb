class Public::EventsController < ApplicationController
  #会員側イベントページ

  def index
    @events = Event.all
    @events = Event.page(params[:page]).per(10)
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:product).permit(:title, :introduction, :image, :event_status)
  end

end
