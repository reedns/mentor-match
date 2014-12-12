class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :basic_http_authentication
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def basic_http_authentication
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end

  def user_not_authorized
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
