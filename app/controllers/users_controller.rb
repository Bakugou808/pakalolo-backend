class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/:userId
  def show
    render json: @user
  end

  # POST /users
  def create
    
    @user = User.new(user_params)
    
    if @user.save
      token = issue_token_on_signup(@user)
      render json: {username: @user.username, id: @user.id, jwt: token}
      # render json: @user, status: :created, location: @user, jwt: token
    else
      render json: {error: @user.errors, status: :unprocessable_entity}
    end
  end

  # GET '/users_smokeLists/:userId'
  def allSmokeLists
    @user = User.find(params[:userId])
    
    @smokeLists = @user.smoke_lists 
    
    render json: @smokeLists
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :password, :password_confirmation, :profileDescription)
    end
end
