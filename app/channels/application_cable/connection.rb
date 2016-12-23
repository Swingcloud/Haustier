module ApplicationCable
  class Connection < ActionCable::Connection::Base

  identified_by :current_user

  def connect
    self.current_user = find_marked_user
    if find_marked_user
      logger.add_tags 'ActionCable', current_user.name
    else
      logger.add_tags 'ActionCable', "new_user"
    end 
  end

  protected
    def find_marked_user
      marked_user = Customer.find_by(id: cookies.signed[:user_id])
    end
  end
end
