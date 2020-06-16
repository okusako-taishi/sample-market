class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
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
  
  def show

  end
  
  def buy

  end

  def edit
    @item = Item.find(params[:id])
  def buy
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
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