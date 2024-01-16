# items_controller.rb
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # ログインしていない場合、newおよびcreateアクションへのアクセスを制限

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user # ログインしているユーザーを商品の出品者として設定

    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :hoge)
  end
end
