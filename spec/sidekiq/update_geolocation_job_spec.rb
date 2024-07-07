# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateGeolocationJob, type: :job do
  subject(:job) { described_class.new }

  let(:contact) { create(:contact, geolocation: nil) }

  before do
    stub_const('ENV', { 'GOOGLE_API_KEY' => 'google_key' })
  end

  it 'updates contact geolocation info' do
    VCR.use_cassette('google/geocoding/successful.yml') do
      job.perform(contact.id)
    end

    contact.reload

    expect(contact.geolocation).to eq('-22.903201 -43.1262765')
  end
end
