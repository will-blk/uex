# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Services', type: :request do
  let(:user) { create(:user) }

  describe 'GET /address' do
    before { sign_in(user) }

    it 'returns http success' do
      get '/services/address', params: { cep: '24210470' }

      expect(response).to have_http_status(:success)
    end
  end
end
