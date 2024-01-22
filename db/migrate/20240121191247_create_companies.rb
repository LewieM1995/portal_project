class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :user_id
      t.string :business_name
      t.string :email
      t.string :phone
      t.string :owner_name
      t.string :business_address
      t.string :business_postcode
      t.integer :employee_count

      t.timestamps
    end
  end
end
