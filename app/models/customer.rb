class Customer < ApplicationRecord
	store :preference, :accessors => [:age, :type, :breed]
	validates_presence_of :name
end

