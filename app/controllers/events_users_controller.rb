class EventsUsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :require_login

    def create 
        # user = User.find(session[:user_id])
        # eu = EventsUser.new(event_id: params[:id], user_id: session[:user_id])
        eu = EventsUser.new(ev_us)
        # eu.user_id = current_user.id
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


    private

    def ev_us
        params.permit(:id)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:id])
    end
end
