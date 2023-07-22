class EventsUsersController < ApplicationController
    before_action :require_login

    def create 
        user = User.find(current_user.id)
        eu = EventsUser.new(event_id: @event.id, user_id: user.id)
        eu.save

        if eu.save 
            flash[:notice] = "Enjoy event!"
            redirect_to root_path
        else
            flash[:alert] = "Ooops! Something went wrong..."
            redirect_to root_path
        end
    end
    
    def destroy

    end
end
