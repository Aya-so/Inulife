class Admin::SearchesController < ApplicationController

  before_action :authenticate_admin!

  def search
  	@model = params[:search][:model]
    @how = params[:search][:how]
    @value = params[:search][:value]

    if @model == "user"
      @users = User.search(@value, @model, @how)
    elsif @model == "event"
      @events = Event.search(@value, @model, @how)
    else
      @groups = Group.search(@value, @model, @how)
    end
  end

end
