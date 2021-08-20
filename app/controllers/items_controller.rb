class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  private

  def items_params
    params.require(:item).permit(
      :image, :item_name, :explanation, :category_id, :status_id,
      :burden_method_id, :shipment_source_id, :shipping_days_id, :price
    ).merge(user_id: current_user.id)
  end
end
