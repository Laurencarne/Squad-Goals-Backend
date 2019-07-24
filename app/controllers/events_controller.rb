class EventsController < ApplicationController
  before_action :validate_logged_in

  def index
    flatmate = current_flatmate
    if flatmate.flat
      events = flatmate.flat.events
    else
      events = flatmate.events
    end
    render json: events, except: [:created_at, :updated_at, :flatmate_id]
  end

  # def show
  #   flatmate = current_flatmate
  #   event = Event.find_by(id: params[:id])
  #   if event.flatmate_id === flatmate.id
  #     render json: event, except: [:created_at, :updated_at, :flatmate_id],
  #       include: [
  #         {
  #         :flatmate => {
  #           except: [:created_at, :updated_at, :password_digest]
  #         }
  #       }
  #     ]
  #   else
  #     render json: {error: "Data Not Avaliable"}
  #   end
  # end

  def create
    event = Event.create(event_params)
    render json: event
  end

  def update
    event = current_flatmate.events.select { |event| event.id === params[:id].to_i}
    if event.length > 0
      event[0].update(event_params)
      render json: event
    else
      render json: {error: "Update Unsuccessful"}
    end
  end

  def destroy
    event = current_flatmate.events.select { |event| event.id === params[:id].to_i}
    if event.length > 0
      event[0].destroy
      render json: {message: "Event Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

private
  def event_params
    params.require(:event).permit(:flatmate_id, :title, :allDay, :start, :end, :description)
  end
end
