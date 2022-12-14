class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
