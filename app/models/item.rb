class Item < ApplicationRecord
	has_many :relationship_item_areas #地域との中間テーブル
	has_many :areas, through: :relationship_item_areas
	accepts_nested_attributes_for :relationship_item_areas #Itemモデル上でrelationship_item_areasをいじれるようにする

	belongs_to :genre
	has_many :posts, dependent: :destroy
	validates :name, presence: true

	#画像アップローダークラスとの紐づけ
	mount_uploader :item_image, ItemImageUploader

	#itemの中から野菜を抽出
	def self.vegetables
		vegetables = self.where(genre_id: 1)
	end

	#itemの中から果物を抽出
	def self.fruits
		fruits = self.where(genre_id: 2)
	end

	#itemの中から魚介類を抽出
	def self.seafoods
		seafoods = self.where(genre_id: 3)
	end

	#itemの中から肉類を抽出
	def self.meats
		meats = self.where(genre_id: 4)
	end

end
