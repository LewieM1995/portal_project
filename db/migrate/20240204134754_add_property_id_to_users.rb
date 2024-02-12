class AddPropertyIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :property, foreign_key: true, default: nil
  end
end
