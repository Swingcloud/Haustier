class NotificationsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(pet)
    pet_info = render_pet_info(pet)
    ActionCable.server.broadcast "public_channel",
                                 pet_info: pet_info
  end

  private

  def render_pet_info(pet)
      CustomersController.render partial: 'customers/pet',
                            		 locals: {pet: pet}
  end
end
