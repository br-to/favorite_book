class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :update, :destroy ]

  def index
    @items = Item.all
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = Item.create!(item_params)
    render json: @item, status: :created
  end
  
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.error, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end