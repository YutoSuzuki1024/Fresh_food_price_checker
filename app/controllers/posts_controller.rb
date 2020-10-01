class PostsController < ApplicationController
  def index
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.item_id = params[:item_id]
    if @post.save
      flash[:success] = "口コミのご協力、ありがとうございます！"
      redirect_to item_path(params[:item_id])
    else
      render 'posts/new'
    end
  end

  def edit
  end

  def show
  end

  def new_confirm
    binding.pry
    @item = Item.find(params[:item_id])
    @post = Post.new
    @post.price_status = params[:price_status]
    @post.price = params[:price]
    @post.shop_name = params[:shop_name]
    @post.comment = params[:comment]
  end

  def edit_confirm
  end

  private
  def post_params
    params.require(:post).permit(:price_status, :price, :shop_name, :comment)
  end
end
