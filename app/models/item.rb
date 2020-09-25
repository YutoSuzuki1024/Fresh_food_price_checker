class Item < ApplicationRecord
	has_many :relationship_item_areas #地域との中間テーブル
	has_many :areas, through: :relationship_item_areas
	accepts_nested_attributes_for :relationship_item_areas #Itemモデル上でrelationship_item_areasをいじれるようにする

	belongs_to :genre
	has_many :posts, dependent: :destroy
	validates :name, presence: true

	attachment :image
end
