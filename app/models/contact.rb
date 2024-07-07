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
  validates :cpf, uniqueness: true, presence: true, format: /\d{11}/i
  validates_with CpfValidator, if: ->(record) { record.cpf_changed? }

  store :address, accessors: %i[logradouro numero localidade bairro uf]
end
