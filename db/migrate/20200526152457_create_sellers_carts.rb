class CreateSellersCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers_carts do |t|
      t.integer :item_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
