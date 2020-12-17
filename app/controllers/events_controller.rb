class EventsController < ApplicationController

  def index
    @events = policy_scope(Event).order(created_at: :desc)


  end

  def show
    @event = Event.find(params[:id])
    @event_atendees = EventAtendee.new
    @atendees = EventAtendee.where(event_id: params[:id])
    @count = event_availability
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def event_availability
    @event = Event.find(params[:id])
    @atendees = EventAtendee.where(event_id: params[:id])
    @capacity = @event.capacity
    @people = 0

    @atendees.each do |atendee|
      @people += atendee.people
    end
    @count = @capacity - @people
    return @count
  end

  private

  def event_params
    params.require(:event).permit(:title, :date_time, :image, :details, :capacity)
  end
end
