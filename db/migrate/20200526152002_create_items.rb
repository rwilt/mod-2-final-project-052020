class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :photo
      t.integer :quantity, default: 100
      
      t.timestamps
    end
  end
end
