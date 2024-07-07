# frozen_string_literal: true

class CpfValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    @cpf = record.cpf
    @numbers = cpf.chars.map(&:to_i)

    validate_cpf_length
    validate_cpf_digits
  end

  private

  attr_reader :record, :cpf, :numbers

  def validate_cpf_length
    return if cpf.size == 11

    record.errors.add(:cpf, :size)
  end

  def validate_cpf_digits # rubocop:disable Metrics/AbcSize
    [10, 11].each do |digit|
      multiplied = numbers[0...(digit - 1)].map.each_with_index do |number, index|
        number * (digit - index)
      end

      mod = multiplied.sum % 11
      expected = mod < 2 ? 0 : 11 - mod

      record.errors.add(:cpf, :invalid) if numbers[(digit - 1)] != expected
    end
  end
end
