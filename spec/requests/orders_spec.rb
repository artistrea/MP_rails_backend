require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:admin) { create(:user, user_type: 2) }
  let(:cook) { create(:user, user_type: 0) }

  let(:admin_headers) { { 'X-User-Token': admin.authentication_token, 'X-User-Email': admin.email } }
  let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }


  describe 'GET /index' do
    before do
      create(:order)
      create(:order)
      get '/orders/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    
    it 'returns 2 orders' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET /show' do
    let(:order) { create(:order) }

    context 'when order exists' do
      before { get "/orders/show/#{order.id}" }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when order does not exists' do
      before { get "/orders/show/-1" }

      it 'returns http not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # describe 'POST /create' do
  #   let(:valid_params) do
  #     {
  #       user_id: { create(:user).id },
  #       client_id: { create(:client).id },
  #       products: []
  #     }
  #   end

  #   it "returns http success when admin uses valid params" do
  #     post "/orders/create",
  #     params: {
  #       order: valid_params
  #     },
  #     headers: admin_headers
      
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "returns http unprocessable_entity when admin uses invalid params" do
  #     post "/orders/create",
  #     params: {
  #       order: invalid_params
  #     },
  #     headers: admin_headers
      
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end

  #   it "returns http created when cook uses valid params" do
  #     post "/orders/create",
  #     params: {
  #       order: valid_params
  #     },
  #     headers: cook_headers
      
  #     expect(response).to have_http_status(:created)
  #   end

  #   it "returns http unprocessable_entity when cook uses invalid params" do
  #     post "/orders/create",
  #     params: {
  #       order: invalid_params
  #     },
  #     headers: cook_headers
      
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  # end

  describe 'PATCH /update' do
    let(:valid_params) do
      {
        status: 2
      }
    end
    let(:invalid_params) do
      {
        user_id: -1
      }
    end
    let(:order) { create(:order) }
    
    it "returns http success when admin uses valid params" do
      patch "/orders/update/#{order.id}",
      params: {
        order: valid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:success)
    end

    it "returns http unprocessable_entity when admin uses invalid params" do
      patch "/orders/update/#{order.id}",
      params: {
        order: invalid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http bad_request when admin updates unexisting order" do
      patch "/orders/update/-1",
      params: {
        order: valid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:not_found)
    end

    it "returns http success when cook uses valid params" do
      patch "/orders/update/#{order.id}",
      params: {
        order: valid_params
      },
      headers: cook_headers
      
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /delete' do
    let(:order) { create(:order) }

    it 'returns http success if valid id' do
      delete "/orders/delete/#{order.id}", headers: admin_headers
      expect(response).to have_http_status(:success)
    end

    it 'returns http not_found if invalid id' do
      delete '/orders/delete/-1', headers: admin_headers
      expect(response).to have_http_status(:not_found)
    end
  end
end
