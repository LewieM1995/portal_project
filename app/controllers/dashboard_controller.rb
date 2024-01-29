class DashboardController < ApplicationController
  before_action :require_login

  def show
    @user = User.find_by(client_id: session[:user_id])
    puts "This is my user ID: #{@user}"
  end

  private

  def require_login
    unless session[:user_id]
      logger.info "User not logged in. Redirecting to login_path."
      redirect_to login_path, notice: "Enter your credentials"
    end
  end
end
