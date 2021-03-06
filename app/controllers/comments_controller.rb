class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # GET /all_comments/:referenceId
  def allComments 
    
    comments = Comment.where(commentable_type: params[:type], commentable_id: params[:referenceId])
    
    render json: comments

  end

  # POST /comments
  def create
    
    @comment = Comment.new(comment_params)
    
    if @comment.save
      
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      render json: {message: 'Comment Destroyed'}
    else 
      render json: {error: @comment.errors}
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:user_id, :username, :commentable_id, :commentable_type, :rating, :comment)
    end
end
