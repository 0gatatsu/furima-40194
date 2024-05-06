class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_action, only: [:edit, :show, :update ]

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
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :image, :price, :content, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end
end