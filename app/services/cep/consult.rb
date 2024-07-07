# frozen_string_literal: true

module Cep
  class Consult
    def initialize(cep)
      @cep = cep
    end

    def execute
      result = api.address_from(cep)

      result.parsed_response.slice(
        *%w[
          logradouro
          bairro
          localidade
          uf
        ]
      )
    end

    private

    attr_reader :cep

    def api
      @api ||= ViaCep::Api.new
    end
  end
end
