class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :bio
      t.string :photo
      t.integer :phone
      t.integer :zip
      t.string :hours

      t.timestamps
    end
  end
end
