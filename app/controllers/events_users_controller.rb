class EventsUsersController < ApplicationController
    before_action :require_login

    def create 
        event = Event.find(params[:event_id])
        eu = EventUser.new(event_id: event.id, user_id: params[:user_id])

        if eu.save 
            flash[:notice] = "Enjoy event!"
            redirect_to users_path(event_id: event.id)
        else
            flash[:alert] = "Ooops! Something went wrong..."
            redirect_to event_path(event)
        end
    end
    
    def destroy

    end
end
