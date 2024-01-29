class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address_first
      t.string :address_second
      t.string :address_third
      t.string :postcode
      t.string :email
      t.string :password
      t.string :client_id

      t.timestamps
    end
  end
end
