class UsersController < ApplicationController
    
#GET /signup- New User action
    def new
      @user = User.new
    end
    

   #POST /users - create the User action
    def create
      @user = User.new(user_params)
    
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end 

    def show
      @user = User.find_by_id(params[:id])
    end
  

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
