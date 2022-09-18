class ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, except: %i[show index]

      def index
        products = Product.all
        render json: products, status: :ok
      end

      def show
        product = Product.find(params[:id])
        render json: product, status: :ok
      rescue StandardError
        head(:not_found)
      end

      def create
        product = Product.create(product_params)
        product.save!
        render json: product, status: :created
      rescue StandardError
        head(:unprocessable_entity)
      end

      def update
        product = Product.find(params[:id])
        product.update!(product_params)
        render json: product, status: :ok
      rescue ActiveModel::ValidationError, ActiveRecord::RecordInvalid
        head(:unprocessable_entity)
      rescue ActiveRecord::RecordNotFound
        head(:not_found)
      end

      def delete
        product = Product.find(params[:id])
        product.destroy!
        render json: product, status: :ok
      rescue StandardError
        head(:not_found)
      end

      private

      def product_params
        params.require(:product).permit(
          :name,
          :description,
          :quantity_in_stock,
          :prep_time_in_minutes
        )
      end
    end
  end
end
