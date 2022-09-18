class TablesController < ApplicationController
    acts_as_token_authentication_handler_for User

    def index
        tables = Tables.all
        render json: tables, status: :ok
    end

    def create
        if current_user.user_type < 2
            render json: { message: 'Não autorizado' }, status: :unauthorized
            return
        end
        tables = Table.create!(table_params)
        
        render json: tables, status: :created
    rescue StandardError => e
        p e
        render json: { message: e }, status: :bad_request
    end

    def delete
        if current_user.user_type < 2
            render json: { message: 'Não autorizado' }, status: :unauthorized
            return
        end
        table = Table.find(params[:id])
        table.destroy!
        render json: table, status: :ok
    rescue StandardError => e
        render json: { message: e }, status: :bad_request
    end

    private

    def table_params
        params.require(:table).permit(
            :number
        )
    end

end
