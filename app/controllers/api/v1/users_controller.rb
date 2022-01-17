class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    
  end
end
