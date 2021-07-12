class Public::EventsController < ApplicationController
  #会員側イベントページ

  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :introduction, :start, :finish, :place, :image, :event_status)
  end

end
