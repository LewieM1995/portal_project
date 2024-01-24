class CreateClientDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :client_details do |t|
      t.string :client_id
      t.string :client_name
      t.string :email
      t.string :number
      t.string :client_address
      t.string :client_postcode

      t.timestamps
    end
  end
end
