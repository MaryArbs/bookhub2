class SessionsController < ApplicationController
  before_action :current_user
  skip_before_action :require_login, only: [:index, :new, :create, :omniauth]

  

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully logged in!'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Please fill out all required fields!'
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def omniauth
    @user =
      User.find_or_create_by(uid: auth[:uid]) do |u|
        u.username = auth[:info][:username]
        u.email = auth[:info][:email]
        u.password = SecureRandom.hex
      end
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages
      redirect_to '/signup'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end 
end
