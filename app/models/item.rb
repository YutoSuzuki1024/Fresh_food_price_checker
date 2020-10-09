class Item < ApplicationRecord
	belongs_to :area
	belongs_to :genre
	has_many :posts, dependent: :destroy
	validates :name, presence: true

	#画像アップローダークラスとの紐づけ
	mount_uploader :item_image, ItemImageUploader

end
