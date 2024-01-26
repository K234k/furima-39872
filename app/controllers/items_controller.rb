class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update]

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
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to item_path
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end
end

def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id,
                               :shipping_date_id, :price).merge(user_id: current_user.id)
end
