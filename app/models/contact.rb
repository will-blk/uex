# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name,
            :cpf,
            :phone,
            :address,
            :zipcode, presence: true
  validates_with CpfValidator
end
