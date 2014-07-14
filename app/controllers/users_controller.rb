class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])  
  end


  def edit
    if session[:current_user] == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to users_path
    end
  end

  def update
    if session[:current_user] == params[:id].to_i
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path
      else
        render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:current_user] = nil
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password,
    :password_confirmation, :discipline, :artist_statement, :location, :contact_info,
    :instagram, :facebook, :twitter, :website, :avatar)
  end
end
