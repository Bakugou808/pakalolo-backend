class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all

    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # GET /users_entries/:userId
  def allEntries 
    @user = User.find(params[:userId])
    @entries = @user.all_entries
    render json: @entries 
  end 

  # POST /entries
  def create
    
    @entry = Entry.new(entry_params)
     
    if @entry.save
      render json: @entry, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  
  def update
    
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    entryId = @entry.id
    if @entry.destroy
      
      render json: {id: entryId, data: 'entry deleted'}
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:collection_id, :vendor_id, :review, :rating)
    end
end
