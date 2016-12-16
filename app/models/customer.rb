class Customer < ApplicationRecord
	store :preference, :accessors => [:age, :species, :breed]
	validates_presence_of :name
end

