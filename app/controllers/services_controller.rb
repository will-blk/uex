# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!, only: :address

  def address
    address = Cep::Consult.new(params[:cep]).execute

    render json: address
  end
end
