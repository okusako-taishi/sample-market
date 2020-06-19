class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @parents = Category.where(ancestry: nil)

    anc = @category.ancestry
    match_id = []

    if anc.blank?  #親カテゴリーの抽出
      anc_set ="^#{@category.id}/"
      reg = Regexp.new(anc_set)
      not_null_categories = Category.where.not("ancestry IS NULL")
      not_null_categories.each do |c|
        if c[:ancestry].match(reg)
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id)
    elsif anc.match(/\//)  #孫カテゴリーの抽出
      @items = Item.where(category_id: @category.id)
    else
      parent = anc
      child = @category_id
      anc_set = "#{parent}/#{child}"
      Category.all.each do |c|
        if c[:ancestry] == anc_set
          match_id << c.id
        end
      end
      @items = Item.where(category_id: match_id)
    end
  end
end
