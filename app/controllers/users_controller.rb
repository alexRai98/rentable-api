class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  
  def show
    render json: current_user
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase! # avoid duplicates and case-sensitive login errors

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email,:phone ,:name, :password)
  end

  # def user_patch_params
  #   params.permit(:name, :phone)
  # end
end