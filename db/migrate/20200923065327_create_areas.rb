class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.boolean :is_deleted, default: false, null: false

      t.timestamps
    end
  end
end
