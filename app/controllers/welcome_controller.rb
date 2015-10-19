class WelcomeController < ApplicationController

def index
	
end

def admin
	@event = Event.new
end

def event_create
	@event = Event.new(event_params)
	if @event.save
		flash[:notice] = "Saved"
		redirect_to :action => "admin"
	else
		flash[:notice] = "Not saved"
		redirect_to :action => "admin"
	end
end

private

def event_params
	params.require(:event).permit(:city, :address, :date, :time, :price, :prize)
end

end

