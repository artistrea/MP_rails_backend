require 'rails_helper'

RSpec.describe "Contact_us", type: :request do
  describe 'GET /index' do
    before do
      create(:order)
      create(:order)
      get '/contact_us/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:valid_params) do
      {
        name: "Artur",
        email: "artur@aa.com",
        message: "Ava ninguém gosta daqui"
      }
    end

    let(:invalid_params) do
      {
        name: "Artur",
        email: "artur@aa.com",
        message: ""
      }
    end

    it 'returns http success when admin uses valid params' do
      post '/contact_us/create',
           params: {
             contact_message: valid_params
           }

      expect(response).to have_http_status(:success)
    end


    it 'returns http unprocessable_entity when using invalid params' do
      post '/contact_us/create',
           params: {
             contact_message: invalid_params
           }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
