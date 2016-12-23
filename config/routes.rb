Rails.application.routes.draw do
	resource :session
	resources :customers , only: %i(show) do 
		get 'matches', on: :member
		get 'adopt', on: :member
	end
	resources :pets, only: %i(index show)
	scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
		resources :pets, only: %i(show create) do 
			get 'matches', on: :member
		end
		resources :customers, only: %i(show create) do 
			get 'matches', on: :member
			post 'adopt', on: :member
		end
	end

	mount ActionCable.server => "/cable"

	root :to => 'home#index'

end
