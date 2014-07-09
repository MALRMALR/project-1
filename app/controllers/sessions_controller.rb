class SessionsController < ApplicationController
  def new
  end

  def create
    # params[:username]
    # params[:password]

    # Find the user with that username
    user = User.find_by(username: params[:username])
    # Validates password / Authenticates User
    authenticated = user.authenticate(params[:password])

    # Remember the fact that the user has been authenticated.
    if authenticated
      session[:current_user] = user.id
      redirect_to users_path
    else
      redirect_to login_path
    end

  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path
  end
end
