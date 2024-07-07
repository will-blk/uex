# frozen_string_literal: true

class Contact < ApplicationRecord
  validates_with CpfValidator
end
