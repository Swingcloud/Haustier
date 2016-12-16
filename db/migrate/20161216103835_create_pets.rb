class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
    	t.string :type
    	t.string :name
    	t.integer :age
    	t.string :breed, default: ""
      t.timestamps
    end
  end
end
