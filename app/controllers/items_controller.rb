class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :item_params, only: :create
  def index
  end

  def new
   @item = Item.new 
   @item.build_brand
   @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status, :cost, :prefecture_code, :days, :price, images_attributes: [:url], brand_attributes: [:name])
  end

end

