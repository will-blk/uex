# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name,
            :cpf,
            :phone,
            :logradouro,
            :numero,
            :localidade,
            :bairro,
            :uf,
            :zipcode, presence: true
  validates_with CpfValidator

  store :address, accessors: %i[logradouro numero localidade bairro uf]
end
