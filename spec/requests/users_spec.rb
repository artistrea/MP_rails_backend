RSpec.describe 'Users', type: :request do
  let(:admin) { create(:user, user_type: 2) }
  let(:cook) { create(:user, user_type: 0) }

  let(:admin_headers) { { 'X-User-Token': admin.authentication_token, 'X-User-Email': admin.email } }
  let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }

  describe 'POST /create' do
    valid_user_params = { email: 'teste@teste.com', password: '123456', user_type: 1 }
    invalid_user_params = { email: 'teste@teste.com', password: '12345', user_type: 1 }

    it 'returns http success if admin requested with valid params' do
      post '/users/create',
           params: {
             user: valid_user_params
           },
           headers: admin_headers

      expect(response).to have_http_status(:success)
    end

    it 'returns unprocessable_entity if admin requested with invalid params' do
      post '/users/create',
           params: {
             user: invalid_user_params
           },
           headers: admin_headers

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns unauthorized if cook requested' do
      post '/users/create',
           params: {
             user: valid_user_params
           },
           headers: cook_headers

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index', headers: cook_headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /login' do
    context 'when valid credentials' do
      before do
        post '/users/login', params: { email: admin.email, password: admin.password }
      end

      it 'returns http success when valid credentials' do
        expect(response).to have_http_status(:success)
      end

      it 'returns authentication_token and user_type in response body' do
        expect(JSON.parse(response.body)).to include('authentication_token', 'user_type')
      end
    end

    it 'returns unauthorized when invalid password' do
      post '/users/login', params: { email: admin.email, password: 'a123a' }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized when invalid email' do
      post '/users/login', params: { email: 'admin.email', password: admin.password }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /delete' do
    it 'returns http success if valid id' do
      delete "/users/delete/#{admin.id}", headers: admin_headers
      expect(response).to have_http_status(:success)
    end

    it 'returns http bad_request if invalid id' do
      delete '/users/delete/-1', headers: admin_headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
