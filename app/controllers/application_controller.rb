class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method :current_user
  # helper_method :signed_in
  #
  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end
  #
  # def current_user=(user)
  #   @current_user = user
  # end
  #
  # def current_user?(user)
  #   user == current_user
  # end
  #
  # def signed_in?
  #   !current_user.nil?
  # end
  #
  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_path, notice: "Please sign in."
  #   end
  # end

  private
  def authenticate
    if !session[:current_user]
      redirect_to login_path
    end
  end

  def authorize
    if session[:current_user] != params[:id].to_i
      redirect_to users_path
    end
  end
end
