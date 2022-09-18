require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:waiter) { create(:user, user_type: 1) }
  let(:cook) { create(:user, user_type: 0) }

  let(:waiter_headers) { { 'X-User-Token': waiter.authentication_token, 'X-User-Email': waiter.email } }
  let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }

  let(:table) { create(:table) }

  describe 'POST /create' do
    it 'returns http success if waiter requested with valid params' do
      post '/clients/create',
           params: {
             client: { table_id: table.id }
           },
           headers: waiter_headers

      expect(response).to have_http_status(:success)
    end

    it 'returns unauthorized if cook requested' do
      post '/clients/create',
           params: {
             client: { table_id: table.id }
           },
           headers: cook_headers

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/clients/index', headers: cook_headers
      expect(response).to have_http_status(:success)
    end
  end
end
