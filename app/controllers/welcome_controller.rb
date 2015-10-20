class WelcomeController < ApplicationController
before_action :authenticate_user!, only: [:admin, :event_create, :event_delete]
before_action :check_if_admin!, only: [:admin, :event_create, :event_delete] 

def index
	@events = Event.all
end

def admin
	@event = Event.new
	@events = Event.all
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

def event_delete
	@event = Event.find(params[:id])
	@event.destroy
	flash[:notice] = "Tournois supprimé"
	redirect_to :action => "admin"
end

private

def event_params
	params.require(:event).permit(:city, :address, :date, :time, :price, :prize)
end

def check_if_admin!
	if not current_user.admin?
		redirect_to root_path
	end
end

end

