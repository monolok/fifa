class Event < ActiveRecord::Base
	validates :city, presence: true

end
