# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name,
            :cpf,
            :phone,
            :address,
            :zipcode, presence: true
  validates_with CpfValidator
end
