class Pet < ApplicationRecord
	validates_presence_of :name, :age
	geocoded_by :address   
	after_validation :geocode          
end
