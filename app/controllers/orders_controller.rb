class OrdersController < ApplicationController
def index
  @order_shipping = OrderShipping.new.include(:item)
end

def create
  @order_shipping = OrderShipping.new(order_shipping_params)
  if @order_shipping.valid?
    pay_item
    @order_shipping.save
    return redirect_to root_path
  else
    render 'index'
  end
end

private

def order_shipping_params
  params.require(:order_shipping).permit(
    :postal_code, :shipment_source_id, :city, :block, :building, :phone
  ).merge(user_id: current_user.id, item_id: params[:id],token: params[:token])
end

def   pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
end

end