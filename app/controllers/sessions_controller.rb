
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(client_id: params[:user][:client_id])
    if user
      puts "User found: #{user.inspect}"
      puts "Password provided: #{params[:password]}"
      puts "Authentication result: #{user.authenticate(params[:password])}"
      puts "First name provided: #{params[:first_name]}"
      puts "User first name: #{user.first_name}"
    
      if user.authenticate_password(params[:user][:password]) && user.first_name == params[:user][:first_name]
        puts "User logged in successfully!"
        session[:user_id] = user.client_id
        redirect_to dashboard_path, notice: "Welcome to your Dashboard, #{user.first_name}!"
      else
        puts "Login failed. Invalid credentials."
        flash.now.alert = "Invalid login credentials"
        render :new
      end
    else
      puts "User not found."
      flash.now.alert = "Invalid login credentials"
      render :new
    end
    
    
  end
  
  

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
