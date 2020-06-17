class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :authenticate_user! , except: [:index ,:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:family_name,:first_name,:family_name_kana,:first_name_kana, :birth_day,])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_image,:introduction])
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

end
