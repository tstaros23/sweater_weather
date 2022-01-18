class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { errors: {details: "Bad credentials"}}, status: :bad_request
    end
  end
end
