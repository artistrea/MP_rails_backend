class OrdersController < ApplicationController
  acts_as_token_authentication_handler_for User, except: %i[show index index_consult]

  def index
    orders = Order.all.order(created_at: :asc)
    render json: orders, status: :ok
  end

  def show
    order = Order.find(params[:id])
    render json: order, status: :ok
  rescue StandardError
    head(:not_found)
  end

  def index_consult
    orders = Order.where(status: params[:status]).order(created_at: :asc)
    render json: orders, status: :ok
  rescue StandardError
    head(:bad_request)
  end

  def create
    order = Order.create(order_params)
    order.save!
    render json: order, status: :created
  rescue StandardError => e
    head(:unprocessable_entity)
  end

  def update
    order = Order.find(params[:id])
    order.update!(order_params)
    render json: order, status: :ok
  rescue ActiveModel::ValidationError, ActiveRecord::RecordInvalid
    head(:unprocessable_entity)
  rescue ActiveRecord::RecordNotFound
    head(:not_found)
  end

  def delete
    order = Order.find(params[:id])
    order.destroy!
    render json: order, status: :ok
  rescue StandardError
    head(:not_found)
  end

  private

  def order_params
    params.require(:order).permit(
      :client_id,
      :user_id,
      :status,
      product_ids: []
    )
  end
end
