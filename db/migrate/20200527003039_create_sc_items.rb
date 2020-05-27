class CreateScItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sc_items do |t|
      t.integer :sellers_cart_id
      t.integer :item_id
      t.timestamps
    end
  end
end
