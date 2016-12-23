class SessionsController < ApplicationController
	skip_before_action :mark_current_user, only: %i( new create )

  def new
    @customers = Customer.all
  end

  def create
    identify_user(params[:user_id])
    redirect_to root_path
  end

  def destroy
    erase_user
    redirect_to new_session_url
  end
end
