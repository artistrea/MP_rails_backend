require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:admin) { create(:user, user_type: 2) }
  let(:cook) { create(:user, user_type: 0) }

  let(:admin_headers) { { 'X-User-Token': admin.authentication_token, 'X-User-Email': admin.email } }
  let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }


  describe 'GET /index' do
    before do
      create(:product, name: 'product 1')
      create(:product, name: 'product 2')
      get '/products/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    
    it 'returns 2 products' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET /show' do
    let(:product) { create(:product) }

    context 'when product exists' do
      before { get "/products/show/#{product.id}" }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when product does not exists' do
      before do
        product.destroy!
        get "/products/show/#{product.id}"
      end

      it 'returns http not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /create' do
    let(:valid_params) do
      {
        name: "new product",
        description: "product created for test",
        quantity_in_stock: 50,
        prep_time_in_minutes: 10
      }
    end
    let(:invalid_params) do
      {
        name: "",
        description: "",
        quantity_in_stock: 0,
        prep_time_in_minutes: 0
      }
    end

    it "returns http success when admin uses valid params" do
      post "/products/create",
      params: {
        product: valid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:success)
    end

    it "returns http bad_request when admin uses invalid params" do
      post "/products/create",
      params: {
        product: invalid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http unauthorized when cook uses valid params" do
      post "/products/create",
      params: {
        product: valid_params
      },
      headers: cook_headers
      
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT /update' do
    let(:valid_params) do
      {
        quantity_in_stock: 40
      }
    end
    let(:invalid_params) do
      {
        prep_time_in_minutes: 0
      }
    end
    let(:product) { create(:product) }
    
    it "returns http success when admin uses valid params" do
      post "/products/update/#{product.id}",
      params: {
        product: valid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:success)
    end

    it "returns http bad_request when admin uses invalid params" do
      post "/products/update/#{product.id}",
      params: {
        product: invalid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http bad_request when admin updates unexisting product" do
      post "/products/update/-1",
      params: {
        product: valid_params
      },
      headers: admin_headers
      
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http unauthorized when cook uses valid params" do
      post "/products/update/#{product.id}",
      params: {
        product: valid_params
      },
      headers: cook_headers
      
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /delete' do
    let(:product) { create(:product) }

    it 'returns http success if valid id' do
      delete "/product/delete/#{product.id}", headers: admin_headers
      expect(response).to have_http_status(:success)
    end

    it 'returns http bad_request if invalid id' do
      delete '/product/delete/-1', headers: admin_headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
