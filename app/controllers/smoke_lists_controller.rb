class SmokeListsController < ApplicationController
  before_action :set_smoke_list, only: [:show, :update, :destroy]

  # GET /smoke_lists
  def index
    @smoke_lists = SmokeList.all

    render json: @smoke_lists
  end

  # GET /smoke_lists/1
  def show
    render json: @smoke_list
  end

  # POST /smoke_lists
  def create
    
    @smoke_list = SmokeList.new(smoke_list_params)
    
    if @smoke_list.save
      render json: @smoke_list, status: :created, location: @smoke_list
    else
      render json: @smoke_list.errors, status: :unprocessable_entity
    end
  end

  # POST /smoke_lists/new_entry
  def newEntry 
    
    @entry = EntriesSmokeList.new(entry_id: params[:entry_id], smoke_list_id: params[:smoke_list_id])
    
    if @entry.save 
      @newEntry = @entry.entry
      render json: @newEntry 
    else 
      render json: @entry.errors
    end
  end

  # DELETE '/smoke_lists/delete/:sleId'

  def deleteEntry 
    
    @entry_smoke_list = EntriesSmokeList.where(entry_id: params[:entry_id], smoke_list_id: params[:smoke_list_id])[0]
    entryId = params[:entry_id]
    byebug
    if @entry_smoke_list.destroy
      render json: entryId 
    else 
      render json: @entry_smoke_list.errors
    end
  end

  # PATCH/PUT /smoke_lists/1
  def update
    if @smoke_list.update(smoke_list_params)
      render json: @smoke_list
    else
      render json: @smoke_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /smoke_lists/1
  def destroy
    
    smokeListId = @smoke_list.id
    if @smoke_list.destroy
      
      render json: {id: smokeListId, data: 'entry deleted'}
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smoke_list
      @smoke_list = SmokeList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smoke_list_params
      params.require(:smoke_list).permit(:user_id, :entry_id, :title, :description)
    end
end
