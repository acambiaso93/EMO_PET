class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.boolean :available_for_rent

      t.timestamps
    end
  end
end
