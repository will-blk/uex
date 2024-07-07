# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:contact) { create(:contact) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:logradouro) }
    it { is_expected.to validate_presence_of(:numero) }
    it { is_expected.to validate_presence_of(:localidade) }
    it { is_expected.to validate_presence_of(:bairro) }
    it { is_expected.to validate_presence_of(:uf) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
  end
end
