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
end
