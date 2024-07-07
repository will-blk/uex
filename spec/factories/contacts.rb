# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    user
    name { Faker::Name.unique.name }
    cpf { '14791485041' }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    zipcode { Faker::Address.zip_code }
    geolocation { "#{Faker::Address.latitude} #{Faker::Address.longitude}" }
  end
end
