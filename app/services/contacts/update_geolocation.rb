# frozen_string_literal: true

module Contacts
  class UpdateGeolocation
    def initialize(contact)
      @contact = contact
    end

    def execute
      contact.update(geolocation:)
    end

    private

    attr_reader :contact

    def geolocation
      geocoding_service.execute.values.join(' ')
    end

    def geocoding_service
      @geocoding_service ||= Google::Geocoding.new(contact.address)
    end
  end
end
