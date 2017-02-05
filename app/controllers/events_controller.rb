class EventsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_event, :only => [:show, :edit, :update, :destroyt]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end

  end

  def show
    #@event = Event.find(params[:id])
    #@page_title = @event.name
  end

  def edit
    #@event = Event.find(params[:id])
  end

  def update
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end

  end

  def destroy
    #@event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit( :name, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
