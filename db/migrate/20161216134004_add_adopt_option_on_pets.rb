class AddAdoptOptionOnPets < ActiveRecord::Migration[5.0]
  def change
  	add_column :pets, :is_adopted, :boolean, default: false
  end
end
