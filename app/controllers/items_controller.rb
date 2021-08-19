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

  private

#  def items_params
#  end ストロングパラメーター記述

end
