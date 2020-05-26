class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :phone
      t.integer :zip
      t.string :email

      t.timestamps
    end
  end
end
