RSpec.describe 'Users', type: :request do
  describe 'POST /create' do
    let(:admin) { create(:user, user_type: 2) }
    let(:cook) { create(:user, user_type: 0) }

    let(:admin_headers) { { 'X-User-Token': admin.authentication_token, 'X-User-Email': admin.email } }
    let(:cook_headers) { { 'X-User-Token': cook.authentication_token, 'X-User-Email': cook.email } }

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

  # describe 'GET /index' do
  #   it 'returns http success' do
  #     get '/users/index'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'POST /login' do
  #   it 'returns http success' do
  #     post '/users/login', params: { email: 'teste@teste.com', password: '123456' }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'DELETE /delete' do
  #   it 'returns http success' do
  #     user = create(:user)
  #     delete "/users/delete/#{user.id}"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
