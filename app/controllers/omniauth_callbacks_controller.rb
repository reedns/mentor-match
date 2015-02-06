class OmniauthCallbacksController < ApplicationController
  # Courtesy of https://gist.github.com/ivanoats/7076144
  # def all
  #   user = User.from_omniauth(request.env['omniauth.auth'], session[:role])
  #   session[:role] = nil
  #   if user.persisted?
  #     flash.notice = "#{user.first_name}, you are signed in!"
  #     sign_in_and_redirect user, notice: 'You are signed in!'
  #   else
  #     session['devise.user_attributes'] = user.attributes
  #     redirect_to new_user_registration_url
  #   end
  # end
  #
  # alias_method :linkedin, :all
  # alias_method :github, :all

  def linkedin
    user = User.get_picture(request.env['ominauth.auth'])
    if user.persisted?
      flash.now[:notice] = 'Picture changed!'
      redirect_to user_path(user)
    else
      render "users/#{user.id}"
    end
  end



end
