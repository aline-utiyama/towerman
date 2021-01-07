class Event::EventAtendeesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @events_atendees = current_user.event_atendees_as_event.order(date_time: :asc)
    @event_atendee = policy_scope(EventAtendee)
    @events = policy_scope(Event).order(date_time: :asc)
  end


end
