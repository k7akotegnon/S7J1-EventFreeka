class EventsController < ApplicationController
  def index
    @events = Event.includes(:administrator, :attendances).order(start_date: :asc)
  end

  def show
    @event = Event.includes(:administrator, attendances: :user).find(params[:id])
  end
end
