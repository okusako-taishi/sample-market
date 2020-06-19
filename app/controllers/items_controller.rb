class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :show, :create,:get_category_children,:get_category_grandchildren]

  def index
    @items = Item.includes(:images)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
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
    @comment = Comment.new
    if @comment.save
      render item_path(comment.item.id)
    else
      
  end
end

  def create
    @item = Item.new(item_params)
    if @item.valid?
    @item.save
      redirect_to root_path
    else
      #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
      render :new
    end
  end

  def edit
    
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
    @items = Item.all
    @items = Item.includes(:images, :brands)
  end
end