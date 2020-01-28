class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end  

  # def google
  #   @user = User.from_omniauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     # flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #     # redirect_to action: :index unless user_signed_in?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  #   else
  #     session['devise.google_data'] = request.env['omniauth.auth']
  #     redirect_to tweets_path 
  #   end
  # end


  def google
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to new_user_registraition_url
    end 
end
def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
end
 
end

