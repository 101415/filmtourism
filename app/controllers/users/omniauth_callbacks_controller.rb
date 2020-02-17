class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :configure_permitted_parameters, if: :devise_controller?

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

