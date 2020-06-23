class ItemsController < ApplicationController
  before_action :item_params, only: :create
  before_action :set_item, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]

  def index
    @items = Item.all
    @items = Item.includes(:images)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end



  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
      render :new
    end
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

  def edit
    if user_signed_in? && current_user.id == @item.saler_id
      grandchild_category = @item.category
      child_category = grandchild_category.parent

      @category_parent_array = Category.where(ancestry: nil).pluck(:name,:id)
      
      @category_children_array = Category.where(ancestry: child_category.ancestry).pluck(:name,:id)

      @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry).pluck(:name,:id)
      # grandchild_category = @item.category
      # child_category = grandchild_category.parent
  
  
      # @category_parent_array = []
      # Category.where(ancestry: nil).each do |parent|
      #   @category_parent_array << parent.name
      # end
  
      # @category_children_array = []
      # Category.where(ancestry: child_category.ancestry).each do |children|
      #   @category_children_array << children
      # end
  
      # @category_grandchildren_array = []
      # Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      #   @category_grandchildren_array << grandchildren
      # end
    else 
      @items = Item.all
      render :index
    end
  end

  def update
    if @item.update(item_params)
      session.delete(:error)
      redirect_to root_path
    else
      session[:error] = @item.errors.full_messages
      redirect_to action: :edit
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
    @items = Item.all
    @items = Item.includes(:images, :brands)
  end
end