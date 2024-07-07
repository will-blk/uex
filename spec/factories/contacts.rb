# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    user
    name { Faker::Name.name }
    cpf { '14791485041' }
    phone { Faker::PhoneNumber.phone_number }
    address do
      {
        logradouro: 'Rua Presidente Pedreira',
        numero: '33',
        complemento: 'apto 1001',
        bairro: 'Ingá',
        localidade: 'Niterói',
        uf: 'RJ'
      }
    end
    zipcode { '24210-470' }
    geolocation { "#{Faker::Address.latitude} #{Faker::Address.longitude}" }
  end
end
