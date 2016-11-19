class EventsController < ApplicationController
  def index
    @events = Event.order(date: :asc)
    @user = User.all
  end
  
  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    @event.save

    if @event.save
      redirect_to user_path(current_user)
    else
      flash.now.notice = 'Event could not be created.'
      render 'new'
    end
  end

  def event_params
    params.require(:event).permit(:title, :location,:description, :date)
  end
end
