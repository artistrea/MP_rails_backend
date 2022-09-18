require 'rails_helper'

RSpec.describe 'Tables', type: :request do
  let(:admin) { create(:user, user_type: 2) }
  let(:cook) { create(:user, user_type: 0) }

  let(:admin_headers) { { 'X-User-Token': admin.authentication_token, 'X-User-Email': admin.email } }
  let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }

  describe 'POST /create' do
    valid_table_params = { number: 1 }

    it 'returns http success if admin requested with valid params' do
      post '/tables/create',
           params: {
             table: valid_table_params
           },
           headers: admin_headers

      expect(response).to have_http_status(:success)
    end

    it 'returns unauthorized if cook requested' do
      post '/tables/create',
           params: {
             table: valid_table_params
           },
           headers: cook_headers

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /delete' do
    it 'returns http success if valid id' do
      table = create(:table)
      delete "/tables/delete/#{table.id}", headers: admin_headers
      expect(response).to have_http_status(:success)
    end

    it 'returns http bad_request if invalid id' do
      delete '/tables/delete/-1', headers: admin_headers
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/tables/index', headers: cook_headers
      expect(response).to have_http_status(:success)
    end
  end
end
