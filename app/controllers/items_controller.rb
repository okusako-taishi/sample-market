class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :pay]
  before_action :item_params, only: :create
  before_action :set_item, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]

  def index
    @items = Item.all
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
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def buy
    if card.exists?
      @card     = Card.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]
    end
  end

  def pay
    @card = Card.find_by(user_id: current_user.id)
    @item.save!
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    @charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    currency: 'jpy'
    )
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

    params.require(:item).permit(:name, :description, :category_id, :status, :cost, :prefecture_id, :days, :price, images_attributes: [:url, :_destroy, :id], brand_attributes: [:name],).merge(user_id: current_user.id).merge(saler_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id])
    @items = Item.includes(:images, :brands)
  end
end