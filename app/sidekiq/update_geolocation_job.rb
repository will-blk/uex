# frozen_string_literal: true

class UpdateGeolocationJob
  include Sidekiq::Job

  def perform(contact_id)
    contact = Contact.find(contact_id)

    Contacts::UpdateGeolocation.new(contact).execute
  end
end
