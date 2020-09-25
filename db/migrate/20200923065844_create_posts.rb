class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :member_id, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.integer :area_id, foreign_key: true
      t.integer :price_status, default: 1
      t.integer :price
      t.string :shop_name
      t.text :comment

      t.timestamps
    end
  end
end
