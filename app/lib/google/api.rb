# frozen_string_literal: true

module Google
  class Api
    include HTTParty
    base_uri 'https://maps.googleapis.com'

    def geocoding(address_components)
      address = address_components.slice(*%w[logradouro numero bairro localidade uf])

      self.class.get('/maps/api/geocode/json', query: { address: address.values.join(', '), key: })
    end

    private

    def key
      ENV.fetch('GOOGLE_API_KEY')
    end
  end
end
