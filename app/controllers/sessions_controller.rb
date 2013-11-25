class SessionsController < ApplicationController
  def new
    @user=User.new
  end
  def create
    user=User.authenticate(params[:email],params[:password])
    if user
      session[:user_id]=user.id
      redirect_to root_url, :notice => "Login Successful"
    else
      flash.now.alert = "Invalid email / password"
      render "new"
    end
      
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to root_url, :notice => "Logout Successful"
  end
  
end
