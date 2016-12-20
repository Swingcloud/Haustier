class Pet < ApplicationRecord
	validates_presence_of :name, :age
	geocoded_by :address   
	after_validation :geocode  

	after_create_commit do 
		NotificationsBroadcastJob.perform_later(self)
	end        
end
