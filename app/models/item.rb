class Item < ApplicationRecord
	belongs_to :area
	
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
