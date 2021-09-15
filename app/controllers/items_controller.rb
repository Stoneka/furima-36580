class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item_tag = ItemTag.new
  end

  def create
    @item_tag = ItemTag.new(item_tag_params)
    if @item_tag.valid?
      @item_tag.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
        @item.destroy
        redirect_to root_path
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(
      {images:[]}, :item_name, :explanation, :category_id, :status_id,
      :burden_method_id, :shipment_source_id, :shipping_days_id, :price,
      :tag_name
    ).merge(user_id: current_user.id)
  end

=begin
Formオブジェクトパターン実装による記述の変更
=end
  def items_params
    params.require(:item).permit(
      {images:[]}, :item_name, :explanation, :category_id, :status_id,
      :burden_method_id, :shipment_source_id, :shipping_days_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
