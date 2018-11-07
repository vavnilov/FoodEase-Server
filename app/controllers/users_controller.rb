class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    find_user
    render json:@user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
    # byebug
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
