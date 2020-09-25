class Area < ApplicationRecord
	has_many :relationship_item_areas #商品との中間テーブル
	has_many :items, through: :relationship_item_areas, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :members

	validates :name, presence: true
	validates :name, uniqueness: true

end
