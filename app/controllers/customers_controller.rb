class CustomersController < ApplicationController
	before_action :find_customer
	include Identification

	def show 
	end

	def matches
		if @customer.preference == {}
			@pets = Pet.all
		else
			@pets = Pet.where(type: @customer.species).
								where(age: @customer.age).
								where(breed: @customer.breed).
								where(is_adopted: false)
		end
	end

	private 
		def find_customer
			erase_user
			@customer = Customer.find(params[:id])
			identify_user(params[:id])
		end
end
