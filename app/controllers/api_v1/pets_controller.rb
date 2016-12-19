class ApiV1::PetsController < ApiController 
	
	def show
		@pet = Pet.find(params[:id])
		render :json => @pet.to_json
	end

	def create
		@pet = Pet.new( 
			type: params[:type].capitalize, 
			name: params[:name], 
			age: params[:age], 
			breed: params[:breed],
			address: params[:address] )
		if @pet.save
			render :json => { :pet => @pet.to_json ,:message => "OK!!!!!!!!"}
		else
			render :json => { :message => "please type the correct data" }, :status => 400
		end
	
	end




end
