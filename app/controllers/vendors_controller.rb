class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :update, :destroy]

  # GET /vendors
  def index
    @vendors = Vendor.all

    render json: @vendors
  end

  # GET /vendors/1 
  def show
    render json: @vendor
  end

  # GET /users_vendors/:userId 
  def allVendors
    
    user = User.find(params[:userId])
    # vendors = user.all_vendors
    vendors = Vendor.where(user_id: params[:userId])
    if vendors 
      render json: vendors
    else 
      render json: {error: 'No Vendors'}
    end
  end

  # POST /vendors
  def create
    
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      render json: @vendor, status: :created, location: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendors/1
  def update
    
    if @vendor.update(vendor_params)
      render json: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendors/1
  def destroy
    if @vendor.destroy
      
      render json: {data: 'vendor deleted'}
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:vendor).permit(:name, :rating, :user_id)
    end
end
