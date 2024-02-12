class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.includes(:property).all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find_by(client_id: params[:client_id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.send_client_id(@user).deliver_now
        format.html { redirect_to login_path, notice: "Sign up successful, check your email for your Login ID" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find_by(client_id: params[:client_id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find_by(client_id: params[:client_id])
  
    if @user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User: #{params[:client_id]} was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, alert: "User with client_id #{params[:client_id]} not found." }
        format.json { head :not_found }
      end
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(client_id: params[:client_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :address_first, :address_second, :address_third, :postcode, :email, :password, :client_id, :dob, :property_id)
    end
end
