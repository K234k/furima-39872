class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params) # アソシエーションのbuildメソッドを利用
    if @item.save
      redirect_to item_path(@item), notice: '商品を出品しました。'
    else
      render :new
    end
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :image)
  end
end
