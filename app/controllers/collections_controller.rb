class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :update, :destroy]

  # GET /collections
  def index
    @collections = Collection.all

    render json: @collections
  end

  # GET /collections/1
  def show
    render json: @collection
  end

  # GET /users_collections/#userId 

  def entireCollection
  
    collection = Collection.where(user_id: params[:userId]) 
    
    if collection
      render json: collection
    else
      render json:{ error: "Nothing To Render", status: :unprocessable_entity}
    end

  end


    # GET /tags/strains_with_tag/:tagTitle/:userId

    def matchedTags
      user = User.find(params[:userId])
      
      matchedCollectionIds = Collection.getTagMatches(params[:tagTitle], user)
      
      render json: Collection.find(matchedCollectionIds) 
  
    end


  # POST /collections
  def create
    @collection = Collection.new(collection_params)
    
    if @collection.save
      render json: @collection, status: :created, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def collection_params
      params.require(:collection).permit(:strain_id, :user_id, :rating)
    end
end
