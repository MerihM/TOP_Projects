class EventsController < ApplicationController
    def index 
        @events = Event.all
    end

    def show 
        @event = Event.find(params[:id])
    end

    def new 
        @event = Event.new
    end

    def create 
        @event = current_user.events.build(event_params)

        if @event.save
            flash[:success] = "Event '#{@event.title}' created!"
            redirect_to root_path
        else
            flash[:alert] = "Thera was an error"
            render 'new'
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_path, status: :see_other
    end
    private
    def event_params
      params.require(:event).permit(:title, :event_date, :user_id)
    end
    
end
