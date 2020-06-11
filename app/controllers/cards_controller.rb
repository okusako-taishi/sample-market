class CardsController < ApplicationController
  def new
    @card = Card.new
    card = Card.where(user_id: current_user.id)
    if card.exists?
      redirect_to card_path(card[0].id)
    end
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    token = Payjp::Token.create({
      card: {
        number: params[:card][:number],
        cvc: params[:card][:cvc],
        exp_month: params[:card][:exp_month],
        exp_year: params[:card][:exp_year]
      }},
      {'X-'}
    )
end
