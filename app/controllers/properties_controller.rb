class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:index,:show] 

  # GET /properties
  def index
    if params[:owner_id]
      @properties = User.find(params[:owner_id]).properties
    else
      @properties = Property.all
    end

    render json: @properties
  end

  # GET /properties/1
  def show
    @property = Property.find(params[:id])

    render json: @property
  end

  # POST /properties
  def create
    @property = current_user.properties.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def property_params
    params.require(:property).permit(:operation_type, :addres, :monthly_rent, :maintenance,
     :property_type, :bedrooms, :bathrooms, :area, :pets_allowed, :description, :favorites_count, :owner_id,images:[], apartment_amenities:[], building_amenities:[], close_by:[])
  end
end
