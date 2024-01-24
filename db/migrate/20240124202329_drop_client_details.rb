class DropClientDetails < ActiveRecord::Migration[7.0]
  def change
    drop_table :client_details
  end
end