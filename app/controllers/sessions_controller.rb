
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(client_id: params[:user][:client_id])
    if user
      
    
      if user.authenticate(params[:user][:password]) && user.first_name == params[:user][:first_name]
        puts "User logged in successfully!"
        session[:user_id] = user.client_id
        puts "#{session}"
        puts "User found: #{user.inspect}"
        puts "User first name: #{user.first_name}"
        redirect_to dashboard_path, notice: "Welcome to your Dashboard, #{user.first_name}!"
      else
        puts "Login failed. Invalid credentials."
        flash[:notice] = "Invalid login credentials"
        redirect_to login_path
      end
    else
      puts "User not found."
      flash[:notice] = "Invalid login credentials"
      redirect_to login_path
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
