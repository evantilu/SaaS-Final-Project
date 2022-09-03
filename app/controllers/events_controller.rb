class EventsController < ApplicationController

  #user must sign-in to view or edit meetings
  before_action :require_login

  def index
    @events = current_user.events
  end

  def new
    @event = current_user.events.new
  end

  def create
    current_user.events.create(event_parameter)
    redirect_to root_path
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    flash[:notice] = "event '#{@event.title}' deleted."
    redirect_to root_path
  end

  def show
    id = params[:id] 
    @event = current_user.events.find(id) # look up event by unique ID
    # will render app/views/events/show.<extension> by default
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time, :duration)
  end

end

