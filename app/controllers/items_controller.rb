class ItemsController < ApplicationController
	before_action :authenticate_member!

  def index
  	# ユーザーに選択された地域に登録されている食品一覧を出す
    @items = Item.where(area_id: params[:area_id])
  	@vegetables = @items.where(genre_id: 1)
  	@fruits = @items.where(genre_id: 2)
  	@seafoods = @items.where(genre_id: 3)
  	@meats = @items.where(genre_id: 4)

  	@area = Area.find(params[:area_id])
  	@areas = Area.where(is_deleted: false)
  end

  def show
  	@item = Item.find(params[:id])
  	@posts = Post.where(item_id: params[:id]).order(updated_at: "DESC")
  	@areas = Area.where(is_deleted: false)

  	#口コミから、相場価格と特売日価格の平均値をそれぞれ算出
  	@market_price_average = Post.where(price_status: 1, item_id: params[:id]).average(:price)
  	@sale_price_average = Post.where(price_status: 0, item_id: params[:id]).average(:price)

  	#口コミから、相場価格と特売日価格の最安値を出している店舗をそれぞれ算出する
  	@market_price_minimum = Post.where(price_status: 1, item_id: params[:id]).order(:price).first
  	@sale_price_minimum = Post.where(price_status: 0, item_id: params[:id]).order(:price).first
  end
end
