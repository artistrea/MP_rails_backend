class UsersController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [:login]

  def create
    if current_user.user_type < 2
      render json: { message: 'Não autorizado' }, status: :unauthorized
      return
    end
    user = User.create!(user_params)
    render json: user, status: :ok
  rescue StandardError => e
    render json: { message: e }, status: :unprocessable_entity
  end

  def index
  
  end

  # def login; end

  # def delete; end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :user_type
    )
  end
end
