class ApplicationController < ActionController::Base
	include Identification
  protect_from_forgery with: :exception
end
