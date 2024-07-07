# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    @contacts = Contacts::Filter.new(filter_params, pagination_params).execute

    @contacts = @contacts.where(user: current_user)

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params.merge(user: current_user))

    if @contact.save
      UpdateGeolocationJob.perform_async(@contact.id)
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private

  def filter_params
    params.permit(:cpf, :name)
  end

  def pagination_params
    params.permit(:sort_by, :per_page, :page)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(
      [
        :name,
        :cpf,
        :zipcode,
        :phone,
        { address: %i[logradouro numero complemento bairro localidade uf] }
      ]
    )
  end
end
