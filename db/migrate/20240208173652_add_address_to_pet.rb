class AddAddressToPet < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :address, :string
  end
end
