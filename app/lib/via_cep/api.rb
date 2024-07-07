# frozen_string_literal: true

module ViaCep
  class Api
    include HTTParty
    base_uri 'viacep.com.br/ws'

    def address_from(cep)
      self.class.get("/#{cep}/json")
    end
  end
end
