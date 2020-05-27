class CreateBuyersCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_carts do |t|
      t.integer :buyer_id
      t.timestamps
    end
  end
end
