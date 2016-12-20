Rails.application.routes.draw do

	resources :pets
	scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
		resources :pets, only: %i(show create)
		resources :customers, only: %i(show create) do 
			get 'matches', on: :member
			post 'adopt', on: :member
		end
	end

	mount ActionCable.server => "/cable"
end
