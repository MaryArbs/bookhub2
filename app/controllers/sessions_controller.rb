class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :omniauth]

  
  def new
   @user = User.new
  end 

  def create #logging in 
    @user = User.find_by(:email=> params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
     flash[:message] = "Please fill out all required fields!"
     redirect_to '/login'
    end
  end 

  
  def destroy #logout
    session.delete(:user_id)
    redirect_to root_path
  end

  def omniauth  #google log in 
   @user = User.find_or_create_by(uid: auth[:uid]) do |u|
    u.username = auth[:info][:email]
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
