# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def destroy
    if current_user.valid_password?(params[:user][:password])
      user.destroy
      render json: { message: 'Apagado com sucesso' }
    else
      render head: :bad_request
    end
  end
end
