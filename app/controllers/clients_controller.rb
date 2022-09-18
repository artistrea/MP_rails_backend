class ClientsController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    clients = Client.all
    render json: clients, status: :ok
  end

  def create
    if current_user.user_type < 1
      render json: { message: 'Não autorizado' }, status: :unauthorized
      return
    end

    client = Client.create!(client_params)

    render json: client, status: :created
  rescue StandardError => e
    render json: { message: e }, status: :bad_request
  end

  private

  def client_params
    params.require(:client).permit(
      :table_id
    )
  end
end
