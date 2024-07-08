# frozen_string_literal: true

class UpdateGeolocationJob
  include Sidekiq::Job

  sidekiq_options retry: 3
  sidekiq_retry_in { 3.minutes }

  def perform(contact_id)
    contact = Contact.find(contact_id)

    Contacts::UpdateGeolocation.new(contact).execute
  end
end
