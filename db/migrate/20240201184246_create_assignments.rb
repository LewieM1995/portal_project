class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      
      t.timestamps
    end
  end
end
