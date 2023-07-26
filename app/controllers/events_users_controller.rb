class EventsUsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :require_login

    def create 
        eu = EventsUser.new(event_id: params[:id], user_id: current_user.id)
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
