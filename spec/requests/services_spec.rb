# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Services', type: :request do
  let(:user) { create(:user) }

  describe 'GET /address' do
    before { sign_in(user) }

    it 'returns address from cep' do
      VCR.use_cassette('via_cep/success') do
        get '/services/address', params: { cep: '24210470' }
      end

      expect(response.parsed_body).to eq(
        {
          'bairro' => 'Ingá',
          'localidade' => 'Niterói',
          'logradouro' => 'Rua Presidente Pedreira',
          'uf' => 'RJ'
        }
      )
    end
  end
end
