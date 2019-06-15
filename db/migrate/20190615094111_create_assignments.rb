class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :role, foreign_key: true
      t.references :user, foreign_key: true, type: :role_id
      t.timestamps
    end
  end
end
