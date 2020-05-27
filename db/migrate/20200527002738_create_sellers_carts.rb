class CreateSellersCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers_carts do |t|
      t.integer :seller_id
      t.timestamps
    end
  end
end
