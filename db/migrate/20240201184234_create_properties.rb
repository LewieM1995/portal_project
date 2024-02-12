class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :address
      t.string :postcode
      t.string :owner_name
      
      t.timestamps
    end
  end
end
