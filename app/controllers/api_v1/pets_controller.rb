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

	def matches
		@pet = Pet.find(params[:id])
		if @pet.is_adopted == true
			render :json => { :pet => @pet.name, :message => "This pet is no longer available to adopt!"}
		else
			@customers = Customer.where(preference: nil)
			@customers = @customers + Customer.where('preference LIKE ? OR preference LIKE ? OR preference LIKE ? ', "%species: #{@pet.type}\n%", "%age: #{@pet.age}\n%", "%breed: #{@pet.breed}\n%")
			render :json => { :message => "Here is the matching list", :list => JSON.parse(@customers.to_json) }						
		end
		
	end







end
