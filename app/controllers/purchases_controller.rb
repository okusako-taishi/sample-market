class PurchasesController < ApplicationController
  require 'payjp'

  def buy
    @item = Item.find(params[:item_id])
    @images = @item.images.all

    if user_signed_in?
      @user = current_user
      if @user.card.present?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
        @card = Card.find_by(user_id: current_user.id)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
        @card_brand = @customer_card.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.png"
        when "JCB"
          @card_src = "jcb.png"
        when "MasterCard"
          @card_src = "master.png"
        when "American Express"
          @card_src = "amex.png"
        when "Diners Club"
          @card_src = "diners.png"
        when "Discover"
          @card_src = "discover.png"
        end
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @images = @item.images.all

    @item.with_lock do
      if current_user.card.present?
        @card = Card.find_by(user_id: current_user.id)
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
        charge = Payjp::Charge.create(
        amount: @item.price,
        customer: Payjp::Customer.retrieve(@card.customer_id),
        currency: 'jpy'
        )
      else
        Payjp::Charge.create(
        amount: @item.price,
        card: params['payjp-token'],
        currency: 'jpy'
        )
      end
    end
  end
end
