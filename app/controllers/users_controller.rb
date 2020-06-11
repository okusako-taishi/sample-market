class UsersController < ApplicationController
  def index
  end
  
  def show
    @user = current_user
    
  end

  def card
  end

  def logout
  end
end
