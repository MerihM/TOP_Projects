class AttendeesController < ApplicationController
    before_action :authenticate_user!

    def create 
        attendee = Attendee.new(event_id: params[:id], user_id: current_user.id )
        attendee.save
        if attendee.save
            flash[:notice] = "Enjoy event!!!"
            redirect_to root_path
        else
            flash[:alert] = "Ooops, error has occured!!!"
            redirect_to root_path
        end
    end
end
