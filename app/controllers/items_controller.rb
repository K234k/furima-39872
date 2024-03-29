class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_edit, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id && @item.order.blank?
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_edit
    redirect_to root_path if @item.order.present? || current_user.id != @item.user_id
  end
end

def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id,
                               :shipping_date_id, :price).merge(user_id: current_user.id)
end
