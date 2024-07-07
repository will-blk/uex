# frozen_string_literal: true

module Google
  class Geocoding
    def initialize(address)
      @address = address
    end

    def execute
      result = api.geocoding(address)

      result.parsed_response.dig('results', 0, 'geometry', 'location')
    end

    private

    attr_reader :address

    def api
      @api ||= Google::Api.new
    end
  end
end
