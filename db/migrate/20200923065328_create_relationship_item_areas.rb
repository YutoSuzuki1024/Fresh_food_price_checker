class CreateRelationshipItemAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_item_areas do |t|
      t.references :item, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
