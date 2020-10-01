class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, foreign_key: true
      t.string :name
      t.string :item_image

      t.timestamps
    end
  end
end
