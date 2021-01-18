class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # GET /tags/users_tags/:userId

  def usersTags 
    user = User.find(params[:userId])
    tags = user.getTags
    
    if tags
      render json: tags
    else 
      render json: {error: 'no tags found'}
    end 
  end 

  # # GET /tags/strains_with_tag/:tagTitle/:userId

  # def matchedTags
  #   user = User.find(params[:userId])
    
  #   strains = user.getTagMatches(params[:tagTitle])
  #   byebug
  #   render json: strains

  # end
  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    
    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    
    id = @tag.id
    
    if @tag.destroy
      render json: id
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.permit(:collection_id, :title)
    end
end
