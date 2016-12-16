class ApiV1::CustomersController < ApiController

	def show
		@customer = Customer.find(params[:id])
		render :json => @customer.to_json
	end

	def create
		@customer = Customer.new(
			name: params[:name],
			age: params[:age],
			species: params[:species].capitalize,
			breed: params[:breed]
			)
		if @customer.save
			render :json => { :customer => @customer.to_json, :message => "Created successfully!"}
		else
			render :json => { :message => "Please insert the name!"}, :status => 400
		end
	end

	def matches
		@customer = Customer.find(params[:id])
		@pets = Pet.where(type: @customer.species).
								where(age: @customer.age).
								where(breed: @customer.breed).
								where(is_adopted: false)
		render :json => { :message => "Here is your matching list", :list => JSON.parse(@pets.to_json) }
	end


	def adopt
		@customer = Customer.find(params[:id])
		@pet = Pet.find(params[:pet_id])
		@pet.is_adopted = true
		@pet.save
		render :json => { :message => "thank you for your kindness!"}, status => 200
	end
end
