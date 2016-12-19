class AddLatitudeAndLongitudeToPet < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :latitude, :float
    add_column :pets, :longitude, :float
  end
end
