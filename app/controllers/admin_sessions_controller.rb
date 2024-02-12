class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])

    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to properties_path, notice: 'Admin successfully logged in.'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: 'Admin logged out.'
  end
end
