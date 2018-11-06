class AuthController < ApplicationController

  def create
    # byebug
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = issue_token({id: user.id})
      render json: {jwt: token}
    else
      render json: {error: 'User is invalid'}, status: 401
    end
  end

  def show
    token = request.headers["Authorization"]
    user = User.find_by(id: token)

    if user
      render json: {username: user.username, id: user.id }
    else
      render json: {error: 'Invalid token'}, status: 401
    end
  end
end
