class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :initial_stock
      t.references :user, foreign_key: true
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
