class NotificationsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(pet)
    @customers = Customer.all
    @customers.each do |customer|
      if customer.preference == {}
        pet_info = render_pet_info(pet, customer)
        pet_brodcast(customer, pet_info)
      elsif pet.breed.nil? && pet.type == customer.species && pet.age == customer.age
        pet_info = render_pet_info(pet, customer)
        pet_brodcast(customer, pet_info)
      elsif pet.breed == customer.breed && pet.type == customer.species && pet.age == customer.age
        pet_info = render_pet_info(pet, customer)
        pet_brodcast(customer, pet_info)
      end  
    end 
  end

  private

  def render_pet_info(pet, customer)
      CustomersController.render partial: 'customers/pet',
                                 locals: {pet: pet, customer: customer}                           
  end

  def pet_brodcast(customer, pet_info)
    ActionCable.server.broadcast "notification_#{customer.id}_channel",
                                 pet_info: pet_info
  end

  
end