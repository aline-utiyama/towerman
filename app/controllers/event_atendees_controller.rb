class EventAtendeesController < ApplicationController
  def index
    @event_atendees = policy_scope(EventAtendee)
    @event_ordered = @event_atendees.each.sort_by { |d| d.event.date_time }

  end

  def show
    @event = Event.find(params[:event_id])
    @event_atendee = EventAtendee.find(params[:id])
    authorize @event_atendee
  end

  def new
    @event_atendee = EventAtendee.new
    authorize @event_atendee
  end

  def create
    @event = Event.find(params[:event_id])
    @event_atendee = EventAtendee.new(event_atendee_params)
    @event_atendee.user = current_user
    @event_atendee.event = @event
    authorize @event_atendee

    if @event_atendee.save
      redirect_to event_path(@event)
    else
      render 'event/show'
    end
  end

  def destroy
    @event_atendee = EventAtendee.find(params[:id])
    authorize @event_atendee
    @event_atendee.destroy

    flash[:notice] = "Event successfully destroyed"
    redirect_to event_atendees_path

  end

  private

  def event_atendee_params
    params.require(:event_atendee).permit(:people)
  end
end
