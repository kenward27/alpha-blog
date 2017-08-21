class SessionsController < ApplicationController
  
  def new #will render a form
    
  end
  
  def create #will be the form submission, will start the session and display the user in a logged in state
    user = User.find_by(email: params[:session][:email].downcase) #if the user was found and was authenticated
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #this saves the user id to the session; the browser's cookies will handle this
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy #will stop the session and move the user to a logged out state
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end 