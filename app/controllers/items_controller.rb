class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create,]

  def index
  end
<<<<<<< HEAD
=======

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
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status, :cost, :prefecture_id, :days, :price, images_attributes: [:url, :_destroy, :id], brand_attributes: [:name],).merge(saler_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

>>>>>>> サーバーサイド商品出品-奥迫
end
