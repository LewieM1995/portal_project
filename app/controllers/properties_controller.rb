
class PropertiesController < ApplicationController
  before_action :require_admin
  before_action :set_property, only: [:edit, :update, :destroy]

  def index
    @properties = Property.all
  end


  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to properties_path, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: 'Property was successfully destroyed.'
  end
  

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_name, :address, :postcode, :owner_name)
  end
end


