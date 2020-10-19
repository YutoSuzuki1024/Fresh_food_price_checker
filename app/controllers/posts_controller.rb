class PostsController < ApplicationController
  before_action :authenticate_member!

  def index
    @posts = Post.where(member_id: current_member.id).order(updated_at: "DESC")
    @member = Member.find(params[:member_id])

    #アクセス制限
    if current_member.id != @member.id
      redirect_to root_path
    end
  end

  def new
    @item = Item.find(params[:item_id])

    #口コミから、相場価格と特売日価格の平均値をそれぞれ算出
    @market_price_average = Post.where(price_status: 1, item_id: params[:item_id]).average(:price)
    @sale_price_average = Post.where(price_status: 0, item_id: params[:item_id]).average(:price)
  end

  def new_confirm
    @item = Item.find(params[:item_id])
    @post = Post.new
    @post.price_status = params[:price_status]
    @post.price = params[:price]
    @post.shop_name = params[:shop_name]
    @post.comment = params[:comment]
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.item_id = params[:item_id]
    @post.score = Language.get_data(post_params[:comment])
    if @post.save
      flash[:success] = "口コミのご協力、ありがとうございます！"
      redirect_to item_path(params[:item_id])
    else
      render 'posts/new'
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @post = Post.find(params[:id])
    @member = Member.find(params[:member_id])
    #アクセス制限
    if current_member.id != @member.id
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.member_id = params[:member_id]
    @post.item_id = params[:item_id]
    @post.score = Language.get_data(post_params[:comment])
    
    if @post.update(post_params)
      flash[:success] = "編集が完了しました！"
      redirect_to posts_index_path(current_member.id)
    else
      render 'posts/edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @member = Member.find(params[:member_id])
    @item = Item.find(params[:item_id])

    #アクセス制限
    if current_member.id != @member.id
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "口コミを削除しました。"
      redirect_to posts_index_path(current_member.id)
    else
      render 'posts/index'
    end
  end

  private
  def post_params
    params.require(:post).permit(:price_status, :price, :shop_name, :comment)
  end
end
