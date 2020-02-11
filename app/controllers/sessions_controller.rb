class SessionsController < ApplicationController
  
  def destroy
    session.delete(:user_id)
    redirect_to '/signup'
 end

 def omniauth
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
