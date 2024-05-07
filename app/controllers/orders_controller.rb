class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_action, only: [:index, :create]
 
  def index
    #@order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
   
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id,:city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id,], token: params[:token])
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

end