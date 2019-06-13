class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :material_name
      t.integer :stock_qty
      t.timestamps
    end
  end
end
