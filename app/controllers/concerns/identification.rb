module Identification
  extend ActiveSupport::Concern
  
  included do
    before_action :mark_current_user
  end

  private
    def mark_current_user
      identify_user(cookies.signed[:user_id])
    end

    def identify_user(user_id)
      if authenticated_user = Customer.find_by(id: user_id)
        cookies.signed[:user_id] ||= user_id
        @current_user = authenticated_user
      end
    end

end