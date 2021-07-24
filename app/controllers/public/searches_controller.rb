class Public::SearchesController < ApplicationController
  #会員側検索

  before_action :authenticate_user!

  def search
  	@model = params[:search][:model]
    @how = params[:search][:how]
    @value = params[:search][:value]

    if @model == 'user'
      @users = User.search(@value, @model, @how)
    elsif @model == 'event'
      @events = Event.search(@value, @model, @how)
    else
      @groups = Group.search(@value, @model, @how)
    end
  end

end
