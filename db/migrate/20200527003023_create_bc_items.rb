class CreateBcItems < ActiveRecord::Migration[6.0]
  def change
    create_table :bc_items do |t|
      t.integer :buyers_cart_id
      t.integer :item_id
      t.timestamps
    end
  end
end
