class Post < ApplicationRecord
	has_many :favorites, dependent: :destroy
	belongs_to :member
	belongs_to :item

	enum price_status: { market_price: 1, sale_price: 0 }
	validates :price_status, inclusion: { in: Post.price_statuses.keys }

	validates :price, presence: true
	validates :shop_name, presence: true

	#店舗名に基づき住所検索
	geocoded_by :shop_name
	after_validation :geocode, if: :shop_name_changed?

	#いいね有無判定
	def favorited_by?(member)
		favorites.where(member_id: member.id).exists?
	end

end
