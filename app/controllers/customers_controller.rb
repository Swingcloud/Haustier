class CustomersController < ApplicationController
	before_action :find_customer, except: :index
	include Identification

	def index 
		@customers = Customer.all
	end

	def show 
	end

	def matches
		if @customer.preference == {}
			@pets = Pet.all.where(is_adopted: false)
		else
			@pets = Pet.where(type: @customer.species).
								where(age: @customer.age).
								where(breed: @customer.breed).
								where(is_adopted: false)
		end
	end

	def adopt
		@customer = Customer.find(params[:id])
		@pet = Pet.find(params[:pet_id])
		@pet.is_adopted = true
		@pet.save
	end


	private 

		def find_customer
			erase_user
			@customer = Customer.find(params[:id])
			identify_user(params[:id])
		end
end
