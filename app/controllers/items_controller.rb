class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
       @items = Item.includes(:user)
       render :new
    end
  end
end
