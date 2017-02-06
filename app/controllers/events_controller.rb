class EventsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_event, :only => [:show, :edit, :update, :destroyt]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @location = @event.build_location
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
    @location = @event.location
  end

  def edit
    #@event = Event.find(params[:id])
    @location = @event.location
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
    params.require(:event).permit( :name, :description, :category_id, :location_attributes => [:id, :name, :_destroy])
  end

  def set_event
    if params[:id]
      @event = Event.find(params[:id])
    else
      @event = Event.find(params[:event_id])
    end
  end
end
