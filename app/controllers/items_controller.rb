class ItemsController < ApplicationController
  def index
  end

  def new
   @item = Item.new 
   @item.build_brand
   @item.images.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status, :cost, :prefecture_id, :days, :price, images_attributes: [:url], brand_attributes: [:name])
  end

end

