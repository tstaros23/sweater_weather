class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user_params[:email].nil? || user_params[:password].nil? || user_params[:password_confirmation].nil?
      render json: {errors: {details: "Field missing"}}, status: :bad_request
    elsif User.find_by(email: user_params[:email])
      render json: {errors: {details: "Email exists"}}, status: :bad_request
    elsif user_params[:password] != user_params[:password_confirmation]
      render json: {errors: {details: "Password mismatch"}}, status: :bad_request
    elsif user.save
      render json: UserSerializer.new(user), status: :created
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
