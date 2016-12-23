module ApplicationCable
  class Connection < ActionCable::Connection::Base

  identified_by :current_user

  def connect
    self.current_user = find_marked_user
    logger.add_tags 'ActionCable', current_user.name
  end

  protected

    def find_marked_user
      if marked_user = Customer.find_by(id: cookies.signed[:user_id])
        marked_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
