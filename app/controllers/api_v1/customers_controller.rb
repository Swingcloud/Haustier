class ApiV1::CustomersController < ApiController
	before_action :find_customer, except: %i(create)

	def show
		render :json => @customer.to_json
	end

	def create
		@customer = Customer.new(
			name: params[:name],
			age: params[:age].to_i,
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
		if @customer.preference == {}
			@pets = Pet.all.where(is_adopted: false)
		else
			@pets = Pet.where(type: @customer.species).
								where(age: @customer.age).
								where(breed: @customer.breed).
								where(is_adopted: false)
		end
		render :json => { :message => "Here is your matching list", :list => JSON.parse(@pets.to_json) }
	end


	def adopt
		@pet = Pet.find(params[:pet_id])
		@pet.is_adopted = true
		@pet.save
		render :json => { :message => "thank you for your kindness!"}, status => 200
	end

	private

	def find_customer
		@customer = Customer.find(params[:id])
	end
end
