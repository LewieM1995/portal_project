class ClientDetailsController < ApplicationController
  before_action :set_client_detail, only: %i[ show edit update destroy ]

  # GET /client_details or /client_details.json
  def index
    @client_details = ClientDetail.all
  end

  # GET /client_details/1 or /client_details/1.json
  def show
  end

  # GET /client_details/new
  def new
    @client_detail = ClientDetail.new
  end

  # GET /client_details/1/edit
  def edit
  end
  

  # POST /client_details or /client_details.json
  def create
    @client_detail = ClientDetail.new(client_detail_params)

    respond_to do |format|
      if @client_detail.save
        format.html { redirect_to client_detail_url(client_id: @client_detail.client_id), notice: "Client detail was successfully created." }
        format.json { render :show, status: :created, location: @client_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_details/1 or /client_details/1.json
  def update
    @client_detail = ClientDetail.find_by(client_id: params[:client_id])

    respond_to do |format|
      if @client_detail.update(client_detail_params)
        format.html { redirect_to client_detail_url(client_id: @client_detail.client_id), notice: "Client detail was successfully updated." }
        format.json { render :show, status: :ok, location: @client_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_details/1 or /client_details/1.json
  def destroy
    @client_detail = ClientDetail.find(params[:client_id])
    
    if @client_detail
       @client_detail.destroy
        respond_to do |format|
          format.html { redirect_to client_details_url, notice: "Client detail was successfully destroyed." }
          format.json { head :no_content }
      end
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_detail
      @client_detail = ClientDetail.find_by(client_id: params[:client_id])
    end

    # Only allow a list of trusted parameters through.
    def client_detail_params
      params.require(:client_detail).permit(:client_id, :client_name, :email, :number, :client_address, :client_postcode)
    end
end
